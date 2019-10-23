from django.db import models

# Create your models here.
class MenteeData(models.Model):
    mentee_id = models.AutoField(primary_key=True)
    firstname = models.CharField(max_length=50, blank=True, null=True)
    lastname = models.CharField(max_length=50, blank=True, null=True)
    age = models.IntegerField(blank=True, null=True)
    phonenumber = models.CharField(max_length=20, blank=True, null=True)
    email = models.CharField(max_length=50, blank=True, null=True)
    city = models.CharField(max_length=100, blank=True, null=True)
    dob = models.CharField(max_length=20, blank=True, null=True)
    isactive = models.TextField(db_column='isActive', blank=True, null=True)  # Field name made lowercase. This field type is a guess.
    isavailable = models.TextField(db_column='isAvailable', blank=True, null=True)  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'mentee_data'


class MenteeRegistrationData(models.Model):
    mentee_id = models.AutoField(primary_key=True)
    comm_plat = models.CharField(max_length=5, blank=True, null=True)
    desire_dream = models.CharField(max_length=250, blank=True, null=True)
    have_mentor = models.CharField(max_length=250, blank=True, null=True)
    desc_yourslf = models.CharField(max_length=250, blank=True, null=True)
    major_chall = models.CharField(max_length=250, blank=True, null=True)
    ideal_mentor = models.CharField(max_length=250, blank=True, null=True)
    any_else = models.CharField(max_length=250, blank=True, null=True)
    race_req = models.CharField(max_length=5, blank=True, null=True)
    race_details = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'mentee_reg_data'


class MentorData(models.Model):
    mentor_id = models.AutoField(primary_key=True)
    firstname = models.CharField(max_length=50, blank=True, null=True)
    lastname = models.CharField(max_length=50, blank=True, null=True)
    date = models.DateTimeField()
    street_address = models.CharField(max_length=150, blank=True, null=True)
    city_state_zip = models.CharField(max_length=150, blank=True, null=True)
    phonenumber = models.CharField(max_length=20, blank=True, null=True)
    phonenumber_alter = models.CharField(max_length=20, blank=True, null=True)
    email = models.CharField(max_length=50, blank=True, null=True)
    dob = models.DateField(blank=True, null=True)
    pref_contact = models.CharField(max_length=10, blank=True, null=True)
    recent_employer = models.CharField(max_length=100, blank=True, null=True)
    recent_position = models.CharField(max_length=100, blank=True, null=True)
    languages = models.CharField(max_length=100, blank=True, null=True)
    isactive = models.TextField(db_column='isActive', blank=True, null=True)  # Field name made lowercase. This field type is a guess.
    isavailable = models.TextField(db_column='isAvailable', blank=True, null=True)  # Field name made lowercase. This field type is a guess.
    trainingphases = models.IntegerField(db_column='trainingPhases', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'mentor_data'


class MentorRegistrationData(models.Model):
    mentor_id = models.AutoField(primary_key=True)
    why_mentor = models.CharField(max_length=5, blank=True, null=True)
    brief_summary = models.CharField(max_length=250, blank=True, null=True)
    diff_situation = models.CharField(max_length=250, blank=True, null=True)
    min_commit = models.CharField(max_length=250, blank=True, null=True)
    min_avail = models.CharField(max_length=250, blank=True, null=True)
    mentor_training = models.CharField(max_length=250, blank=True, null=True)
    group_meetings = models.CharField(max_length=250, blank=True, null=True)
    any_else = models.CharField(max_length=5, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'mentor_reg_data'


class MentorMenteeAssoc(models.Model):
    mentor_id = models.IntegerField(primary_key=True)
    mentee_id = models.IntegerField()
    match_date = models.DateField(blank=True, null=True)
    expiry_date = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'mentor_mentee_assoc'
        unique_together = (('mentor_id', 'mentee_id'),)

class ActivityList(models.Model):
    activity_id = models.IntegerField()
    activity_type = models.CharField(max_length=50, blank=True, null=True)
    iskept = models.TextField(db_column='isKept', blank=True, null=True)  # Field name made lowercase. This field type is a guess.
    duration = models.CharField(max_length=10, blank=True, null=True)
    comments = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'activity_list'

class ActivitySummary(models.Model):
    activity_id = models.AutoField(primary_key=True)
    mentor_id = models.IntegerField()
    mentee_id = models.IntegerField()
    submission_date = models.DateField(blank=True, null=True)
    callattended = models.TextField(db_column='callAttended', blank=True, null=True)  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'activity_summary'