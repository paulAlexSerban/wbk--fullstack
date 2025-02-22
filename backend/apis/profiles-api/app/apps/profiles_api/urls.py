from django.urls import path

from apps.profiles_api import views

urlpatterns = [
    path('hello-view/', views.HelloApiView.as_view()),
]