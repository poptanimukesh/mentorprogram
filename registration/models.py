from django.db import models

# Create your models here. 
# Define Databases here.

#Mentee Data Table
class menteeData(models.Model):
    mentee_id = models.AutoField(primary_key=True)
    firstname = models.CharField(max_length=50, blank=True, null=True)
    lastname = models.CharField(max_length=50, blank=True, null=True)
    age = models.IntegerField()
    phonenumber = models.CharField(max_length=20, blank=True, null=True)
    email = models.CharField(max_length=50, blank=True, null=True)
    city = models.CharField(max_length=100, blank=True, null=True)
    isActive = models.IntegerField(blank=True, null=True)
    isAvailable = models.IntegerField(blank=True, null=True)

    class Meta:
        db_table = 'mentee_data'

#Mentee Registration Table
class menteeRegistrationData(models.Model):
    mentee_id = models.IntegerField(primary_key=True)
    comm_plat = models.CharField(max_length=250, blank=True, null=True)
    desire_dream = models.CharField(max_length=250, blank=True, null=True)
    have_mentor = models.CharField(max_length=250, blank=True, null=True)
    desc_yourslf = models.CharField(max_length=250, blank=True, null=True)
    major_chall = models.CharField(max_length=250, blank=True, null=True)
    ideal_mentor = models.CharField(max_length=250, blank=True, null=True)
    any_else = models.CharField(max_length=250, blank=True, null=True)
    race_req = models.CharField(max_length=5, blank=True, null=True)
    race_details = models.CharField(max_length=50, blank=True, null=True)
    
    class Meta:
        db_table = 'mentee_reg_data'

#Mentor Data Table
class mentorData(models.Model):
    mentor_id = models.AutoField(primary_key=True)
    firstname = models.CharField(max_length=50, blank=True, null=True)
    lastname = models.CharField(max_length=50, blank=True, null=True)
    street_address = models.CharField(max_length=100, blank=True, null=True)
    city_state_zip = models.CharField(max_length=150, blank=True, null=True)
    phonenumber = models.CharField(max_length=20, blank=True, null=True)
    phonenumber_alter = models.CharField(max_length=20, blank=True, null=True)
    email = models.CharField(max_length=50, blank=True, null=True)
    dob = models.DateTimeField()
    pref_contact = models.CharField(max_length=10, blank=True, null=True)
    recent_employer = models.CharField(max_length=50, blank=True, null=True)
    recent_position = models.CharField(max_length=50, blank=True, null=True)
    languages = models.CharField(max_length=200, blank=True, null=True)
    isActive = models.IntegerField(blank=True, null=True)
    isAvailable = models.IntegerField(blank=True, null=True)
    trainingphases = models.IntegerField(db_column='trainingPhases', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        db_table = 'mentor_data'

class mentorRegistrationData(models.Model):
    mentor_id = models.IntegerField(primary_key=True)
    why_mentor = models.CharField(max_length=250, blank=True, null=True)
    brief_summary = models.CharField(max_length=250, blank=True, null=True)
    diff_situation = models.CharField(max_length=250, blank=True, null=True)
    min_commit = models.CharField(max_length=250, blank=True, null=True)
    min_avail = models.CharField(max_length=250, blank=True, null=True)
    mentor_training = models.CharField(max_length=250, blank=True, null=True)
    group_meetings = models.CharField(max_length=250, blank=True, null=True)
    any_else = models.CharField(max_length=5, blank=True, null=True)
    
    class Meta:
        db_table = 'mentor_reg_data'

