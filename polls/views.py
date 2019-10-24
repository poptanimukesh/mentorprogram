from django.http import HttpResponse
from django.template import loader
from .models import MenteeData, MentorData, MentorMenteeAssoc, MenteeRegistrationData, MentorRegistrationData,  ActivitySummary, ActivityList
from django.views.decorators.csrf import csrf_exempt
from datetime import datetime
import calendar

@csrf_exempt
def index(request):
    template = loader.get_template('home.html')
    context = {
    }
    return HttpResponse(template.render(context, request))

@csrf_exempt
def associate(request):
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

	    template = loader.get_template('associate.html')
	    context = {
	        'mentee_list': mentee_list,
	        'mentor_list': mentor_list,
	    }
	    return HttpResponse(template.render(context, request))

@csrf_exempt
def mentorActivity(request):
    if request.method == 'GET':
        mentorId = 1005
        incomplete_records = getPastIncompleteReports(mentorId)
        template = loader.get_template('mentorActivity.html')
        # logic to fetch from DB
        context = {
        'incomplete_records' : incomplete_records

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
def getPastIncompleteReports(mentorId):
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
    print('LIST', incomplete_records)
    return incomplete_records

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

@csrf_exempt
def viewMentors(request):
    if request.method == "POST":
        mentorId = request.POST['mentor_id']

        mentorObj = MentorData.objects.get(mentor_id = mentorId)
        mentorObj.isactive = '\x00'
        mentorObj.save()

        return HttpResponse("SUCCESS")
    else:
        mentor_list = MentorData.objects.all().filter(isactive = 1)

        template = loader.get_template('listMentors.html')
        context = {
            'mentor_list': mentor_list,
        }
        return HttpResponse(template.render(context, request))

@csrf_exempt
def mentorDetails(request,id):
    if request.method == "POST":
        mentorID = id
        mentorObj = MentorData.objects.get( mentor_id = mentorID)
        mentorObj.email = request.POST.get('email')
        mentorObj.phone = request.POST.get('phone')

        mentorObj.save()

        # All Mentors Redirect
        mentor_list = MentorData.objects.all().filter(isactive = 1)

        template = loader.get_template('listMentors.html')
        context = {
            'mentor_list': mentor_list,
        }
        return HttpResponse(template.render(context, request))
    else:
        mentor_data = MentorData.objects.all().filter(mentor_id = id)
        mentor_reg_data = MentorRegistrationData.objects.all().filter(mentor_id = id)

        template = loader.get_template('mentorDetails.html')
        context = {
            'mentor_data': mentor_data,
            'mentor_reg_data': mentor_reg_data
        }
        return HttpResponse(template.render(context, request))

@csrf_exempt
def viewMentees(request):
    if request.method == "POST":
        menteeId = request.POST['mentee_id']

        menteeObj = MenteeData.objects.get(mentee_id = menteeId)
        menteeObj.isactive = '\x00'
        menteeObj.save()
        
        return HttpResponse("SUCCESS")
    else:
        mentee_list = MenteeData.objects.all().filter(isactive = 1)
        print(mentee_list)

        template = loader.get_template('listMentees.html')
        context = {
            'mentee_list': mentee_list
        }
        return HttpResponse(template.render(context, request))

@csrf_exempt
def menteeDetails(request,id):
    if request.method == "POST":
        menteeID = id
        menteeData = MenteeData.objects.get( mentee_id = menteeID)
        menteeData.email = request.POST.get('email')
        menteeData.phone = request.POST.get('phone')
        menteeData.save()

        # All Mentees Redirect
        mentee_list = MenteeData.objects.all().filter(isactive = 1)
        print(mentee_list)

        template = loader.get_template('listMentees.html')
        context = {
            'mentee_list': mentee_list
        }
        return HttpResponse(template.render(context, request))

    else:
        mentee_data = MenteeData.objects.all().filter(mentee_id = id)
        mentee_reg_data = MenteeRegistrationData.objects.all().filter(mentee_id = id)

        template = loader.get_template('menteeDetails.html')
        context = {
            'mentee_data': mentee_data,
            'mentee_reg_data' : mentee_reg_data
        }
        return HttpResponse(template.render(context, request))