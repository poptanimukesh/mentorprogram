# Generated by Django 2.2.6 on 2019-10-23 17:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0004_auto_20191023_0154'),
    ]

    operations = [
        migrations.RenameField(
            model_name='mentordata',
            old_name='date_of_birth',
            new_name='dob',
        ),
        migrations.RenameField(
            model_name='mentordata',
            old_name='phone',
            new_name='phonenumber',
        ),
        migrations.RenameField(
            model_name='mentordata',
            old_name='phone_alter',
            new_name='phonenumber_alter',
        ),
        migrations.AddField(
            model_name='mentordata',
            name='isActive',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='mentordata',
            name='isAvavilable',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AlterModelTable(
            name='mentordata',
            table='mentor_data',
        ),
    ]
