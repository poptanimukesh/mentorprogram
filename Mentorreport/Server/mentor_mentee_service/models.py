# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


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

class MenteeData(models.Model):
    mentee_id = models.AutoField(primary_key=True)
    firstname = models.CharField(max_length=50, blank=True, null=True)
    lastname = models.CharField(max_length=50, blank=True, null=True)
    phonenumber = models.CharField(max_length=20, blank=True, null=True)
    email = models.CharField(max_length=50, blank=True, null=True)
    dob = models.DateField(blank=True, null=True)
    isactive = models.TextField(db_column='isActive', blank=True, null=True)  # Field name made lowercase. This field type is a guess.
    isavailable = models.TextField(db_column='isAvailable', blank=True, null=True)  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'mentee_data'


class MentorData(models.Model):
    mentor_id = models.AutoField(primary_key=True)
    firstname = models.CharField(max_length=50, blank=True, null=True)
    lastname = models.CharField(max_length=50, blank=True, null=True)
    address = models.CharField(max_length=100, blank=True, null=True)
    phonenumber = models.CharField(max_length=20, blank=True, null=True)
    email = models.CharField(max_length=50, blank=True, null=True)
    dob = models.DateField(blank=True, null=True)
    isactive = models.TextField(db_column='isActive', blank=True, null=True)  # Field name made lowercase. This field type is a guess.
    isavailable = models.TextField(db_column='isAvailable', blank=True, null=True)  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'mentor_data'

class MentorMenteeAssoc(models.Model):
    mentor_id = models.IntegerField(primary_key=True)
    mentee_id = models.IntegerField()
    match_date = models.DateField(blank=True, null=True)
    expiry_date = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'mentor_mentee_assoc'
        unique_together = (('mentor_id', 'mentee_id'),)
