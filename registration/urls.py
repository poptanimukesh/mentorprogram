from django.urls import path

from . import views

urlpatterns = [
    path('mentee/', views.mentee_registration, name='mentee_registration'),
    path('mentor/', views.mentor_registration, name='mentor_registration'),
]
