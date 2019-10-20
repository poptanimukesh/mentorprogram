from django.db import models

# Create your models here. 
# Define Database.
class menteeData(models.Model):
    mentee_id = models.AutoField(primary_key=True)
    firstname = models.CharField(max_length=50, blank=True, null=True)
    lastname = models.CharField(max_length=50, blank=True, null=True)
    age = models.IntegerField()
    phone = models.CharField(max_length=20, blank=True, null=True)
    email = models.CharField(max_length=50, blank=True, null=True)
    city = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        db_table = 'mentee'
        
class menteeRegistrationData(models.Model):
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
        db_table = 'mentee_reg_data'
        

