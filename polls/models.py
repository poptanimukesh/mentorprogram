from django.db import models

# Create your models here.
class MenteeData(models.Model):
    mentee_id = models.AutoField(primary_key=True)
    firstname = models.CharField(max_length=50, blank=True, null=True)
    lastname = models.CharField(max_length=50, blank=True, null=True)
    phonenumber = models.CharField(max_length=20, blank=True, null=True)
    email = models.CharField(max_length=50, blank=True, null=True)
    dob = models.CharField(max_length=20, blank=True, null=True)
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
    dob = models.CharField(max_length=20, blank=True, null=True)
    isactive = models.TextField(db_column='isActive', blank=True, null=True)  # Field name made lowercase. This field type is a guess.
    isavailable = models.TextField(db_column='isAvailable', blank=True, null=True)  # Field name made lowercase. This field type is a guess.
    trainingphases = models.IntegerField(db_column='trainingPhases', blank=True, null=True)  # Field name made lowercase.

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
