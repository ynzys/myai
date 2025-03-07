from django.conf import settings
from django.urls import path
from . import views
from django.conf.urls.static import static

urlpatterns = [
    path('', views.home, name='home'),
    path('track/<int:platform_id>/', views.track_visit, name='track_visit'),
]
urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
