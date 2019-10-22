from django.http import HttpResponse
from django.template import loader
from django.views.decorators.csrf import csrf_exempt
from django.core.mail import send_mail
from .models import menteeData, menteeRegistrationData, mentorData, mentorRegistrationData

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
        send_mail(
            'Registration Successful!!!',
            'Thanks for registring with 50/50 Leadership Organisation as a Mentee. You will be notifited immediately as soon as a Mentor match occurs.\n\n\n\n\n\n\n Thanks & Regards,\n 50/50 Leadership Organization.',
            'leshwar4@gmail.com',
            ['leshwar4@gmail.com'],
            fail_silently=False
        )

    template = loader.get_template('mentee_registration.html')
    context = {}
    return HttpResponse(template.render(context, request))

@csrf_exempt
def mentor_registration(request):
    if request.method == 'POST':
        mData = mentorData()
        mRegData = mentorRegistrationData()

        #Storing Mentor Personal Details
        mData.firstname = request.POST.get('firstname')
        mData.lastname = request.POST.get('lastname')
        mData.date = request.POST.get('date')
        mData.street_address = request.POST.get('street_address')
        mData.city_state_zip = request.POST.get('city_state_zip')
        mData.phone = request.POST.get('phone')
        mData.phone_alter = request.POST.get('phone_alter')
        mData.email = request.POST.get('email')
        mData.date_of_birth = request.POST.get('date_of_birth')
        mData.pref_contact = request.POST.get('pref_contact')
        mData.recent_employer = request.POST.get('employer')
        mData.recent_position = request.POST.get('position')
        mData.languages = request.POST.get('languages')

        #Storing Mentor Other Registration 
        mRegData.why_mentor = request.POST.get('details_1')
        mRegData.brief_summary = request.POST.get('details_2')
        mRegData.diff_situation = request.POST.get('details_3')
        mRegData.min_commit = request.POST.get('details_4')
        mRegData.min_avail = request.POST.get('details_5')
        mRegData.mentor_training = request.POST.get('details_6')
        mRegData.group_meetings = request.POST.get('details_7')
        mRegData.any_else = request.POST.get('details_8')
        
        
        mData.save()
        mRegData.save()

    template = loader.get_template('mentor_registration.html')
    context = {
    }
    return HttpResponse(template.render(context, request))
