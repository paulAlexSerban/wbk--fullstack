from django.contrib import admin
from apps.hello_api import models

# Register your models here.
admin.site.register(models.UserProfile)
