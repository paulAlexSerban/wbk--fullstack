from django.urls import path, include
from rest_framework.routers import DefaultRouter
from apps.hello_api import views

router = DefaultRouter()
router.register('hello-viewset', views.HelloViewSet, basename='hello-viewset')

"""
URL Patterns
- define the URLs for the API
- used with APIViews
"""

urlpatterns = [
    path('hello-view/', views.HelloApiView.as_view()),
    path('', include(router.urls))
]
