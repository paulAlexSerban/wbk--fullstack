"""
Django admin customization for the core app.
"""

from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.utils.translation import gettext_lazy as _
from apps.core import models


class UserAdmin(BaseUserAdmin):
    """
    Custom admin pages for users.
    """

    ordering = ["id"]
    list_display = ["email", "name"]

    # needed to add this to be able to update the user
    fieldsets = (
        (None, {"fields": ("email", "password", "name")}),
        (
            _("Permissions"),
            {"fields": ("is_active", "is_staff", "is_superuser")},
        ),
        (
            _("Important dates"),
            {"fields": ("last_login",)},
        ),
    )
    readonly_fields = ["last_login"]

    # need to add this to the UserAdmin class to allow creating users
    add_fieldsets = (
        (
            None,
            {
                "classes": ("wide",),
                "fields": (
                    "email",
                    "name",
                    "password1",
                    "password2",
                    "is_active",
                    "is_staff",
                    "is_superuser",
                ),
            },
        ),
    )


# Register the custom user model with the admin site
admin.site.register(models.User, UserAdmin)
