from django.http import HttpResponse
from django.template import loader

def mentee_registration(request):
    #latest_question_list = Question.objects.order_by('-pub_date')[:5]
    template = loader.get_template('mentee_registration.html')
    context = {
    }
    return HttpResponse(template.render(context, request))

def mentor_registration(request):
    #latest_question_list = Question.objects.order_by('-pub_date')[:5]
    template = loader.get_template('mentor_registration.html')
    context = {
    }
    return HttpResponse(template.render(context, request))
