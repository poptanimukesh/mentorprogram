from django.http import HttpResponse
from django.template import loader
from .models import MenteeData, MentorData, MentorMenteeAssoc
from django.views.decorators.csrf import csrf_exempt
from datetime import datetime


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