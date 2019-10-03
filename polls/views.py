from django.http import HttpResponse

from .models import MenteeData, MentorData

def index(request):
    mentee_list = MenteeData.objects.order_by('mentee_id')
    mentor_list = MentorData.objects.order_by('mentor_id')
    output = []
    output.append("Mentee, Mentor<br/>");
    output.append(', '.join([str([mentee_list[i].firstname, mentor_list[i].firstname]) for i in range(len(mentor_list))]))
    return HttpResponse(output)

def detail(request, question_id):
    return HttpResponse("You're looking at question %s." % question_id)

def results(request, question_id):
    response = "You're looking at the results of question %s."
    return HttpResponse(response % question_id)

def vote(request, question_id):
    return HttpResponse("You're voting on question %s." % question_id)