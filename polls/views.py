from django.http import HttpResponse
from django.template import loader
from .models import MenteeData, MentorData, MentorMenteeAssoc, ActivitySummary, ActivityList
from django.views.decorators.csrf import csrf_exempt
from datetime import datetime
import json
import calendar

@csrf_exempt
def index(request):
    # t = MenteeData.objects.get(mentee_id=1000)
    # t.firstname = 'Mike'  # change field
    # t.save() # this will update only

    if request.method == "POST":
    	print(request.POST['mentee_id'])
    	mentorId = request.POST['mentor_id']
    	menteeId = request.POST['mentee_id']

    	mentorObj = MentorData.objects.get(mentor_id = mentorId)
    	print(mentorObj.isactive)
    	print(type(mentorObj.isavailable))
    	mentorObj.isavailable = '\x00'
    	mentorObj.save()

    	menteeObj = MenteeData.objects.get(mentee_id = menteeId)
    	menteeObj.isavailable = '\x00'
    	menteeObj.save()

    	assoc = MentorMenteeAssoc(mentor_id = mentorId, mentee_id = menteeId, match_date = datetime.now())
    	print(assoc)
    	assoc.save()
    	return HttpResponse("SUCCESS")
    else:
	    mentee_list = MenteeData.objects.all().filter(isavailable = 1, isactive = 1)
	    mentor_list = MentorData.objects.all().filter(isavailable = 1, isactive = 1)
	    # output = []
	    # output.append("Mentee, Mentor<br/>");
	    # output.append(', '.join([str([mentee_list[i].firstname, mentor_list[i].firstname]) for i in range(len(mentor_list))]))

	    template = loader.get_template('index.html')
	    context = {
	        'mentee_list': mentee_list,
	        'mentor_list': mentor_list,
	    }
	    return HttpResponse(template.render(context, request))

@csrf_exempt
def mentorActivity(request):
    if request.method == 'GET':
        template = loader.get_template('mentorActivity.html')
        # logic to fetch from DB
        context = {

        }
        return HttpResponse(template.render(context, request))
    elif request.method == 'POST':
        body_unicode = request.body.decode('utf-8')
        idx = 1
        response = json.loads(body_unicode)
        print(response)
        if ActivitySummary.objects.filter(mentor_id = response['mentorId'], submission_date = response['yearSelected']).count() > 0:
            return HttpResponse("Already Submitted")
        while 'activity' + str(idx) in response:
            print('ACTIVITY' + str(idx), response['activity' + str(idx)])
            if response['activity' + str(idx)] != '':
                k = 0
                if 'kept' + str(idx) in response:
                    k = 1
                aSummary = ActivitySummary(mentor_id=1005, mentee_id=1, submission_date=response['yearSelected'], callattended=1)
                aSummary.save()
                aList = ActivityList(activity_id=aSummary.activity_id, activity_type=response['activity' + str(idx)], iskept=k
                    , duration=response['duration'+str(idx)], comments=response['comments'+str(idx)])
                aList.save()
            idx = idx + 1
        return HttpResponse("SUCCESS")


''' Checks if a Mentor has any past incomplete reports.
   Input: Mentor Id
'''
@csrf_exempt
def getPastIncompleteReports(request):
    mentorId = request.GET['mentorId']
    assoc = MentorMenteeAssoc.objects.filter(mentor_id = mentorId, match_date__lte = datetime.now(), expiry_date__gte = datetime.now())
    incomplete_records = list()
    if len(assoc) > 0:
        assoc = assoc[0]
        startMonth = str(assoc.match_date.month) + '-' + str(assoc.match_date.year)
        month = assoc.match_date.month
        year = assoc.match_date.year
        today = datetime.today()
        endMonth = str(today.month) + '-' + str(today.year)
        pastCompleteActivites = ActivitySummary.objects.order_by('submission_date').values_list('submission_date', flat= True).filter(mentor_id=mentorId, submission_date__gte = assoc.match_date).distinct()
        
        records = set([str(x.month) + '-' + str(x.year) for x in pastCompleteActivites])
        while startMonth != endMonth:
            if startMonth not in records:
                incomplete_records.append(calendar.month_name[month] + '-' + str(year));
            if month == 12:
                month = 1
                year += 1
            else:
                month += 1
            startMonth = str(month) + '-' + str(year)
    template = loader.get_template('mentorActivity.html')
    context = {
        'incomplete_records': incomplete_records,
    }
    return HttpResponse(template.render(context, request))

@csrf_exempt
def trainingPhases(request):
    if request.method == "POST":
        mentorId = request.POST['mentor_id']

        mentorObj = MentorData.objects.get(mentor_id = mentorId)
        mentorObj.trainingphases = request.POST['trainingphases']
        mentorObj.save()
        print(request.POST['trainingphases'])
        print(mentorObj.isavailable)

        return HttpResponse("SUCCESS")
    else:
        mentor_list = MentorData.objects.all().filter(trainingphases__lt = 4, isactive = 1)
        
        template = loader.get_template('trainingPhases.html')
        context = {
            'mentor_list': mentor_list,
        }
        return HttpResponse(template.render(context, request))

@csrf_exempt
def viewAssociations(request):
    if request.method == "POST":
        mentorId = request.POST['mentor_id']
        menteeId = request.POST['mentee_id']

        mentorObj = MentorData.objects.get(mentor_id = mentorId)
        mentorObj.isavailable = '\x01'
        mentorObj.save()

        menteeObj = MenteeData.objects.get(mentee_id = menteeId)
        menteeObj.isavailable = '\x01'
        menteeObj.save()

        assoc = MentorMenteeAssoc.objects.all().filter(mentor_id = mentorId, mentee_id = menteeId)
        assoc.delete()
        return HttpResponse("SUCCESS")
    else:
        assoc_list = MentorMenteeAssoc.objects.all()

        assoc_mentor_list = []
        assoc_mentee_list = []

        for assoc in assoc_list:
            assoc_mentor_list.append(assoc.mentor_id)
            assoc_mentee_list.append(assoc.mentee_id)

        mentor_data = MentorData.objects.all().filter(mentor_id__in = assoc_mentor_list)
        mentee_data = MenteeData.objects.all().filter(mentee_id__in = assoc_mentee_list)

        mentor_map = dict() #{id -> name}
        mentee_map = dict() #{id -> name}

        for mentor in mentor_data:
            mentor_map[mentor.mentor_id] = mentor.firstname + ' ' + mentor.lastname

        for mentee in mentee_data:
            mentee_map[mentee.mentee_id] = mentee.firstname + ' ' + mentee.lastname

        template = loader.get_template('listAssociations.html')
        context = {
            'assoc_list': assoc_list,
            'mentor_map': mentor_map,
            'mentee_map': mentee_map,
        }
        return HttpResponse(template.render(context, request))