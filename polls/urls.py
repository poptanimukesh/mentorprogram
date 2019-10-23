from django.urls import path

from . import views

urlpatterns = [
    
    path('', views.index, name='index'),

    path('associate', views.associate, name='associate'),
    
    path('trainingPhases/', views.trainingPhases, name='trainingPhases'),

    path('viewAssociations', views.viewAssociations, name='viewAssociations'),

    path('mentorActivity/', views.mentorActivity, name='mentorActivity'),
    
    path('viewMentors', views.viewMentors, name='viewMentors'),

    path('mentorDetails/<int:id>', views.mentorDetails, name='mentorDetails'),

    path('viewMentees', views.viewMentees, name='viewMentees'),

    path('menteeDetails/<int:id>', views.menteeDetails, name='menteeDetails'),
]