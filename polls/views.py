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

def results(request, question_id):
    response = "You're looking at the results of question %s."
    return HttpResponse(response % question_id)

def vote(request, question_id):
    return HttpResponse("You're voting on question %s." % question_id)