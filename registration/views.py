from django.http import HttpResponse
from django.template import loader
from django.views.decorators.csrf import csrf_exempt
from django.core.mail import send_mail
from .models import menteeData, menteeRegistrationData, mentorData, mentorRegistrationData
from django.contrib.auth.models import User

@csrf_exempt
def mentee_registration(request):
    if request.method == 'POST':
        mData = menteeData()
        mRegData = menteeRegistrationData()
        mentee_auto_id = 0

        #Storing Mentee Personal Details
        mData.firstname = request.POST.get('firstname')
        mData.lastname = request.POST.get('lastname')
        mData.age = request.POST.get('age')
        mData.phonenumber = request.POST.get('phone')
        mData.email = request.POST.get('email')
        mData.city = request.POST.get('city')
        mData.isActive = 1
        mData.isAvailable = 1
        
        mData.save()

        #Fetching Primary Key and setting Foreign Key
        phonenumber = request.POST.get('phone')
        for rows in menteeData.objects.raw('SELECT mentee_id FROM mentee_data WHERE phonenumber = %s  LIMIT 1', [phonenumber]):
            mentee_auto_id = rows.mentee_id

        #Storing Mentee Other Registration 
        mRegData.mentee_id = mentee_auto_id
        mRegData.comm_plat = request.POST.get('platform_yes_no')
        mRegData.desire_dream = request.POST.get('details_1')
        mRegData.have_mentor = request.POST.get('details_2')
        mRegData.desc_yourslf = request.POST.get('details_3')
        mRegData.major_chall = request.POST.get('details_4')
        mRegData.ideal_mentor = request.POST.get('details_5')
        mRegData.any_else = request.POST.get('details_6')
        mRegData.race_req = request.POST.get('mentor_race')
        mRegData.race_details = request.POST.get('mentor_race_details')
        
        mRegData.save()

        send_mail(
            'Registration Successful!',
            'Hi, \n You have Successfully registered with 50/50 Leadership organization. \n Our team will get back to you once we have verified your details. \n Thanks and Regards, \n 50/50 Leadership organization.',
            'leshwar4@gmail.com',
            [request.POST.get('email')],
            fail_silently=False,
        )

        template = loader.get_template('registration_success.html')
        context = {}
        return HttpResponse(template.render(context, request))

    template = loader.get_template('mentee_registration.html')
    context = {}
    return HttpResponse(template.render(context, request))

@csrf_exempt
def mentor_registration(request):
    if request.method == 'POST':
        mData = mentorData()
        mRegData = mentorRegistrationData()
        mentor_auto_id = 0

        #Storing Mentor Personal Details
        mData.firstname = request.POST.get('firstname')
        mData.lastname = request.POST.get('lastname')
        mData.street_address = request.POST.get('street_address')
        mData.city_state_zip = request.POST.get('city_state_zip')
        mData.phonenumber = request.POST.get('phone')
        mData.phonenumber_alter = request.POST.get('phone_alter')
        mData.email = request.POST.get('email')
        mData.dob = request.POST.get('date_of_birth')
        mData.pref_contact = request.POST.get('pref_contact')
        mData.recent_employer = request.POST.get('employer')
        mData.recent_position = request.POST.get('position')
        mData.languages = request.POST.get('languages')
        mData.isActive = 1
        mData.isAvailable = 1

        user = User.objects.create_user(mData.email, mData.email, request.POST.get('password'))
        user.first_name = mData.firstname
        user.last_name = mData.lastname
        user.save()

        mData.save()
        
        #Fetching Primary Key and setting Foreign Key
        phonenumber = request.POST.get('phone')
        for rows in mentorData.objects.raw('SELECT mentor_id FROM mentor_data WHERE phonenumber = %s  LIMIT 1', [phonenumber]):
            mentor_auto_id = rows.mentor_id

        #Storing Mentor Other Registration 
        mRegData.mentor_id = mentor_auto_id
        mRegData.why_mentor = request.POST.get('details_1')
        mRegData.brief_summary = request.POST.get('details_2')
        mRegData.diff_situation = request.POST.get('details_3')
        mRegData.min_commit = request.POST.get('details_4')
        mRegData.min_avail = request.POST.get('details_5')
        mRegData.mentor_training = request.POST.get('details_6')
        mRegData.group_meetings = request.POST.get('details_7')
        mRegData.any_else = request.POST.get('details_8')
        
        mRegData.save()

        send_mail(
            'Registration Successful!',
            'Hi, \n You have Successfully registered with 50/50 Leadership organization. \n Our team will get back to you once we have verified your details. \n Thanks and Regards, \n 50/50 Leadership organization.',
            'leshwar4@gmail.com',
            [request.POST.get('email')],
            fail_silently=False,
        )

        template = loader.get_template('registration_success.html')
        context = {}
        return HttpResponse(template.render(context, request))

    template = loader.get_template('mentor_registration.html')
    context = {}
    return HttpResponse(template.render(context, request))
