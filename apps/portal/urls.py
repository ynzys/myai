from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('track/<int:platform_id>/', views.track_visit, name='track_visit'),
]