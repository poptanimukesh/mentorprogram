from django.http import HttpResponse
from django.template import loader
from .models import MenteeData, MentorData, MentorMenteeAssoc, MenteeRegistrationData, MentorRegistrationData,  ActivitySummary, ActivityList
from django.views.decorators.csrf import csrf_exempt
from datetime import datetime
import calendar
import json
from django.forms.models import model_to_dict
from django.shortcuts import render, redirect
import csv
from django.contrib.auth.models import User
import dateutil.relativedelta

@csrf_exempt
def index(request):
    if not request.user.is_authenticated and not request.user.is_staff:
        return redirect("/accounts/login")
    template = loader.get_template('home.html')
    active_mentors = MentorData.objects.all().filter(isactive=1)
    available_mentors = active_mentors.all().filter(isavailable = 1, isactive = 1, trainingphases = 3)
    associated_mentors_count = active_mentors.all().filter(isavailable=0)
    active_mentees = MenteeData.objects.all().filter(isactive=1)
    available_mentees = active_mentees.all().filter(isavailable=1)
    associated_mentees = active_mentees.all().filter(isavailable=0)
    current_month = datetime.now().month
    reports_submitted = ActivitySummary.objects.filter(submission_date__month=current_month)
    print(reports_submitted.count())
    context = {
        'mentor_count': active_mentors.all().count(),
        'pending_training_count': active_mentors.all().exclude(trainingphases=3).count(),
        'available_mentors_count' : available_mentors.count(),
        'associated_mentors_count' : associated_mentors_count.count(),
        'active_mentees_count' : active_mentees.count(),
        'associated_mentees_count' : associated_mentees.count(),
        'reports_submitted_count' : reports_submitted.count(),
        'reports_submitted_perc' : str(round(reports_submitted.count()/associated_mentors_count.count()*100, 2))
    }
    return HttpResponse(template.render(context, request))

@csrf_exempt
def export(request, viewname):
    if not request.user.is_authenticated and not request.user.is_staff:
        return redirect("/accounts/login")
    # Create the HttpResponse object with the appropriate CSV header.
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename="', viewname, '.csv"'

    writer = csv.writer(response)
    if viewname == 'AssociationsList':
        writer.writerow(['Mentor Id', 'Mentor Name', 'Mentee Id', 'Mentee Name', 'Association Date', 'Expiry Date'])
        
        assoc_list, mentor_map, mentee_map = getAssociations();
        for assoc in assoc_list:
            values = []
            values.append(assoc.mentor_id)
            values.append(mentor_map[assoc.mentor_id])
            values.append(assoc.mentee_id)
            values.append(mentee_map[assoc.mentee_id])
            values.append(assoc.match_date)
            values.append(assoc.expiry_date)
            writer.writerow(values)
    elif viewname == 'MentorList':
        writer.writerow(['Mentor Id', 'Mentor Name', 'Email', 'Phone Number', 'Association Date', 'Expiry Date'])
        
        mentor_list = MentorData.objects.all().filter(isactive = 1)
        for m in mentor_list:
            print(m)
            writer.writerow(model_to_dict(m).values())


    return response

@csrf_exempt
def associate(request):
    if not request.user.is_authenticated and not request.user.is_staff:
        return redirect("/accounts/login")
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

    	assoc = MentorMenteeAssoc(mentor_id = mentorId, mentee_id = menteeId, match_date = datetime.now(), expiry_date = addYears(datetime.now(), 1))
    	print(assoc)
        # print("new date: ", addYears(datetime.now(), 1))
    	assoc.save()
    	return HttpResponse("SUCCESS")
    else:
        if request.GET.get('city'):
            city = request.GET.get('city')
            mentee_list = MenteeData.objects.all().filter(isavailable = 1, isactive = 1, city__contains = city)
            mentor_list = MentorData.objects.all().filter(isavailable = 1, isactive = 1, trainingphases = 3, city_state_zip__contains = city)
        else:
            mentee_list = MenteeData.objects.all().filter(isavailable = 1, isactive = 1)
            mentor_list = MentorData.objects.all().filter(isavailable = 1, isactive = 1, trainingphases = 3)
        #print(request.GET.get('ethnicity'))
        
        template = loader.get_template('associate.html')
        context = {
            'mentee_list': mentee_list,
            'mentor_list': mentor_list,
        }
        return HttpResponse(template.render(context, request))

def addYears(d, years):
    try:
#Return same day of the current year        
        return d.replace(year = d.year + years)
    except ValueError:
#If not same day, it will return other, i.e.  February 29 to March 1 etc.        
        return d + (date(d.year + years, 1, 1) - date(d.year, 1, 1))

@csrf_exempt
def mentorActivity(request):
    if not request.user.is_authenticated:
        return redirect("/accounts/login")
    if request.user.is_staff:
        return redirect("/polls/")
    if request.method == 'GET':
        mentor = MentorData.objects.get(email = request.user.email)
        mentorId = mentor.mentor_id
        print(mentorId)
        
        assoc = MentorMenteeAssoc.objects.filter(mentor_id = mentorId, match_date__lte = datetime.now(), expiry_date__gte = datetime.now())
        print(assoc)
        incomplete_records = getPastIncompleteReports(assoc, mentorId)
        start_month = ""
        start_year = ""
        if len(assoc) > 0:
            start_month = assoc[0].match_date.month
            start_year = assoc[0].match_date.year

        template = loader.get_template('mentorActivity.html')
        context = {
          'incomplete_records' : incomplete_records,
          'start_month': start_month,
          'start_year': start_year,
          'mentorId' : mentorId,
          'assoc_len': len(assoc)
        }
        return HttpResponse(template.render(context, request))
    elif request.method == 'POST':
        body_unicode = request.body.decode('utf-8')
        idx = 1
        response = json.loads(body_unicode)
        mentor_id = response['mentorId']
        if ActivitySummary.objects.filter(mentor_id = response['mentorId'], submission_date = response['yearSelected']).count() > 0:
            return HttpResponse("Already Submitted")
        call_attended = 'NO'
        if response['callAttended']:
            call_attended = 'YES'
        report_id = str(mentor_id) + '_' + response['yearSelected']
        activity_summary = ActivitySummary(mentor_id=mentor_id, mentee_id=1, report_id = report_id, submission_date=response['yearSelected'], callattended=call_attended)
        activity_summary.save()
        print(response)
        while 'activity' + str(idx) in response:
            if response['activity' + str(idx)] != '':
                k = 'NO'
                if 'kept' + str(idx) in response:
                    k = 'YES'
                aList = ActivityList(activity_type=response['activity' + str(idx)], iskept=k
                    , hours=response['dur_h'+str(idx)], minutes=response['dur_h'+str(idx)], comments=response['comments'+str(idx)], 
                    report_id = report_id, date = response['date_picker' + str(idx)])
                aList.save()
            idx = idx + 1
        return HttpResponse("SUCCESS")

''' Checks if a Mentor has any past incomplete reports.
   Input: Mentor Id
'''
def getPastIncompleteReports(assoc, mentorId):
    incomplete_records = list()
    if len(assoc) > 0:
        assoc = assoc[0]
        startMonth = str(assoc.match_date.month) + '-' + str(assoc.match_date.year)
        month = assoc.match_date.month
        year = assoc.match_date.year
        today = datetime.today()
        endMonth = str(today.month) + '-' + str(today.year)
        print("DURATION: ", startMonth, " - ", endMonth)
        pastCompleteActivites = ActivitySummary.objects.order_by('submission_date').values_list('submission_date', flat= True).filter(mentor_id=mentorId, submission_date__gte = assoc.match_date - dateutil.relativedelta.relativedelta(months=1)).distinct()
        
        records = set([str(x.month) + '-' + str(x.year) for x in pastCompleteActivites])
        print("pastCompleteActivites Records: ", records)
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
def mentorHistory(request):
    if not request.user.is_authenticated:
        return redirect("/accounts/login")
    mentor = MentorData.objects.get(email = request.user.email)
    mentor_id = mentor.mentor_id
    mentor_history = list()
    assoc_all = MentorMenteeAssoc.objects.filter(mentor_id = mentor_id, match_date__lte = datetime.now(), expiry_date__gte = datetime.now())
    if len(assoc_all) > 0:
        assoc = assoc_all[0]
        start_date = assoc.match_date.replace(day=1)
        activity_summaries = ActivitySummary.objects.all().order_by('-submission_date').filter(mentor_id = mentor_id, submission_date__gte = start_date, submission_date__lte = datetime.now())
        for activity_summary in activity_summaries:
            current_activity = dict()
            current_activity['month'] = calendar.month_name[activity_summary.submission_date.month]
            current_activity['year'] = activity_summary.submission_date.year
            current_activity['collapse_mentor'] = '#collapse_' + str(activity_summary.report_id)
            current_activity['aria_mentor'] = 'collapse_' + str(activity_summary.report_id)
            current_activity['activity_summary'] = model_to_dict(activity_summary)
            activities = [model_to_dict(activity) for activity in ActivityList.objects.all().filter(report_id = activity_summary.report_id)]
            current_activity['activities'] = activities;
            mentor_history.append(current_activity)

    template = loader.get_template('mentorHistory.html')
    context = {
      'mentor_history': mentor_history,
    }
    return HttpResponse(template.render(context, request))  

@csrf_exempt
def trainingPhases(request):
    if not request.user.is_authenticated and not request.user.is_staff:
        return redirect("/accounts/login")
    if request.method == "POST":
        mentorId = request.POST['mentor_id']
        mentorObj = MentorData.objects.get(mentor_id = mentorId)
        mentorObj.trainingphases = request.POST['trainingphases']
        mentorObj.save()
        print(request.POST['trainingphases'])
        print(mentorObj.isavailable)

        return HttpResponse("SUCCESS")
    else:
        mentor_list = MentorData.objects.all().filter(trainingphases__lt = 3, isactive = 1)
        
        template = loader.get_template('trainingPhases.html')
        context = {
            'mentor_list': mentor_list,
        }
        return HttpResponse(template.render(context, request))


def getAssociations():
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

    return assoc_list, mentor_map, mentee_map

@csrf_exempt
def viewAssociations(request):
    if not request.user.is_authenticated and not request.user.is_staff:
        return redirect("/accounts/login")
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
        assoc_list, mentor_map, mentee_map = getAssociations()

        template = loader.get_template('listAssociations.html')
        context = {
            'assoc_list': assoc_list,
            'mentor_map': mentor_map,
            'mentee_map': mentee_map,
        }
        return HttpResponse(template.render(context, request))

@csrf_exempt
def viewMentors(request):
    if not request.user.is_authenticated and not request.user.is_staff:
        return redirect("/accounts/login")
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
def viewSubmittedMentorReport(request):
    if not request.user.is_authenticated and not request.user.is_staff:
        return redirect("/accounts/login")
    if request.method == "GET":
        mentors = list()
        associated_mentors = MentorData.objects.all().filter(isactive = 1, isavailable = 0)
        for associated_mentor in associated_mentors:
            current_mentor = dict()
            current_mentor['mentor_id'] = associated_mentor.mentor_id
            current_mentor['firstname'] = associated_mentor.firstname
            current_mentor['lastname'] = associated_mentor.lastname
            mentors.append(current_mentor)

        template = loader.get_template('viewSubmittedMentorReport.html')
        context = {
            'mentors': mentors
        }
        print(mentors)
        return HttpResponse(template.render(context, request))
    else:
        mentorId = request.POST['mentor_id']
        print(request.POST['start_range'])
        start_range = datetime.strptime(request.POST['start_range'] + '-01', '%B %Y-%d')
        end_range = datetime.strptime(request.POST['end_range'] + '-30', '%B %Y-%d')
        mentor_history = list()
        activity_summaries = ActivitySummary.objects.all().order_by('-submission_date').filter(mentor_id = mentorId, 
            submission_date__gte = start_range, submission_date__lte = end_range)
        for activity_summary in activity_summaries:
            print(activity_summary)
            current_activity = dict()
            current_activity['month'] = calendar.month_name[activity_summary.submission_date.month]
            current_activity['year'] = activity_summary.submission_date.year
            current_activity['collapse_mentor'] = '#collapse_' + str(activity_summary.report_id)
            current_activity['aria_mentor'] = 'collapse_' + str(activity_summary.report_id)
            current_activity['activity_summary'] = model_to_dict(activity_summary)
            current_activity['activity_summary']['submission_date'] = current_activity['activity_summary']['submission_date'].strftime("%Y-%m-%d")
            activities = [model_to_dict(activity) for activity in ActivityList.objects.all().filter(report_id = activity_summary.report_id)]
            for activity in activities:
                activity['date'] = activity['date'].strftime("%Y-%m-%d")

            current_activity['activities'] = activities;
            mentor_history.append(current_activity)

        return HttpResponse(json.dumps(mentor_history))

@csrf_exempt
def mentorDetails(request,id):
    if not request.user.is_authenticated and not request.user.is_staff:
        return redirect("/accounts/login")
    if request.method == "POST":
        mentorID = id
        mentorData = MentorData.objects.get( mentor_id = mentorID)
        mentorData.firstname = request.POST.get('firstname')
        mentorData.lastname = request.POST.get('lastname')
        mentorData.street_address = request.POST.get('street_address')
        mentorData.city_state_zip = request.POST.get('city_state_zip')
        mentorData.phonenumber = request.POST.get('phone')
        mentorData.phonenumber_alter = request.POST.get('phone_alter')
        mentorData.dob = request.POST.get('date_of_birth')
        mentorData.pref_contact = request.POST.get('pref_contact')
        mentorData.recent_employer = request.POST.get('employer')
        mentorData.recent_position = request.POST.get('position')
        mentorData.languages = request.POST.get('languages')

        mentorData.save()

        mentorRegData = MentorRegistrationData.objects.get( mentor_id = mentorID)

        mentorRegData.why_mentor = request.POST.get('details_1')
        mentorRegData.brief_summary = request.POST.get('details_2')
        mentorRegData.diff_situation = request.POST.get('details_3')
        mentorRegData.min_commit = request.POST.get('details_4')
        mentorRegData.min_avail = request.POST.get('details_5')
        mentorRegData.mentor_training = request.POST.get('details_6')
        mentorRegData.group_meetings = request.POST.get('details_7')
        mentorRegData.any_else = request.POST.get('details_8')
        
        mentorRegData.save()

        mentoremail = request.POST.get('email')

        userDetails = User.objects.get(email = mentoremail)
        userDetails.first_name = mentorData.firstname
        userDetails.last_name = mentorData.lastname
        userDetails.save()

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
    if not request.user.is_authenticated and not request.user.is_staff:
        return redirect("/accounts/login")
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
    if not request.user.is_authenticated and not request.user.is_staff:
        return redirect("/accounts/login")
    if request.method == "POST":
        menteeID = id
        menteeData = MenteeData.objects.get( mentee_id = menteeID)
        
        menteeData.firstname = request.POST.get('firstname')
        menteeData.lastname = request.POST.get('lastname')
        menteeData.age = request.POST.get('age')
        menteeData.phonenumber = request.POST.get('phone')
        menteeData.city = request.POST.get('city')
        
        menteeData.save()

        menteeRegData = MenteeRegistrationData.objects.get( mentee_id = menteeID)

        menteeRegData.comm_plat = request.POST.get('platform_yes_no')
        menteeRegData.desire_dream = request.POST.get('details_1')
        menteeRegData.have_mentor = request.POST.get('details_2')
        menteeRegData.desc_yourslf = request.POST.get('details_3')
        menteeRegData.major_chall = request.POST.get('details_4')
        menteeRegData.ideal_mentor = request.POST.get('details_5')
        menteeRegData.any_else = request.POST.get('details_6')
        menteeRegData.race_req = request.POST.get('mentor_race')
        menteeRegData.race_details = request.POST.get('mentor_race_details')
        
        menteeRegData.save()

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


def logout(req):
    return render(req,"registration/logout.html",{})