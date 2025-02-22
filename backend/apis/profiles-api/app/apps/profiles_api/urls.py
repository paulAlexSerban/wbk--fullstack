from django.urls import path, include
from rest_framework.routers import DefaultRouter
from apps.profiles_api import views

router = DefaultRouter()
router.register('hello-viewset', views.HelloViewSet, basename='hello-viewset')
router.register('profile', views.UserProfileViewSet)

"""
URL Patterns
- define the URLs for the API
- used with APIViews
"""

urlpatterns = [
    path('hello-view/', views.HelloApiView.as_view()),
    path('login/', views.UserLoginApiView.as_view()),
    path('', include(router.urls))
]
