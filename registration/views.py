from django.http import HttpResponse
from django.template import loader
from django.views.decorators.csrf import csrf_exempt
from .models import menteeData
from .models import menteeRegistrationData

@csrf_exempt
def mentee_registration(request):
    if request.method == 'POST':
        mData = menteeData()
        mRegData = menteeRegistrationData()

        #Storing Mentee Personal Details
        mData.firstname = request.POST.get('firstname')
        mData.lastname = request.POST.get('lastname')
        mData.age = request.POST.get('age')
        mData.phone = request.POST.get('phone')
        mData.email = request.POST.get('email')
        mData.city = request.POST.get('city')

        #Storing Mentee Other Registration 
        mRegData.comm_plat = request.POST.get('platform_yes_no')
        mRegData.desire_dream = request.POST.get('details_1')
        mRegData.have_mentor = request.POST.get('details_2')
        mRegData.desc_yourslf = request.POST.get('details_3')
        mRegData.major_chall = request.POST.get('details_4')
        mRegData.ideal_mentor = request.POST.get('details_5')
        mRegData.any_else = request.POST.get('details_6')
        mRegData.race_req = request.POST.get('mentor_race')
        mRegData.race_details = request.POST.get('mentor_race_details')
        
        mData.save()
        mRegData.save()

    template = loader.get_template('mentee_registration.html')
    context = {}
    return HttpResponse(template.render(context, request))

def mentor_registration(request):
    
    template = loader.get_template('mentor_registration.html')
    context = {
    }
    return HttpResponse(template.render(context, request))
