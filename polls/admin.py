from django.contrib import admin

# Register your models here.

from .models import *

admin.site.register(MenteeData)
admin.site.register(MenteeRegistrationData)
admin.site.register(MentorData)
admin.site.register(MentorRegistrationData)
admin.site.register(MentorMenteeAssoc)