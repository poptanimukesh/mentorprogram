# Generated by Django 2.2.6 on 2019-10-23 01:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0003_mentordata_mentorregistrationdata'),
    ]

    operations = [
        migrations.RenameField(
            model_name='menteedata',
            old_name='phone',
            new_name='phonenumber',
        ),
        migrations.AddField(
            model_name='menteedata',
            name='isActive',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='menteedata',
            name='isAvavilable',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AlterModelTable(
            name='menteedata',
            table='mentee_data',
        ),
    ]