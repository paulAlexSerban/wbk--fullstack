"""
Test the models in the core app.
"""

from django.test import TestCase
from django.contrib.auth import get_user_model


class ModelTests(TestCase):
    """Test models in the core app."""

    def test_create_user_with_email_successful(self):
        """Test creating a user with an email is successful."""
        email = "test@example.com"
        password = "testpass123"
        user = get_user_model().objects.create_user(email=email, password=password)
        self.assertEqual(user.email, email)
        self.assertTrue(user.check_password(password))

    def test_new_user_email_normalized(self):
        """Test the email for a new user is normalized."""

        sample_emails = [
            ["test1@EXAMPLE.com", "test1@example.com"],
            ["Test2@Example.com", "test2@example.com"],
            ["TEST3@EXAMPLE.COM", "test3@example.com"],
            ["test4@example.COM", "test4@example.com"],
        ]

        for email, expected in sample_emails:
            user = get_user_model().objects.create_user(
                email=email, password="testpass123"
            )
            self.assertEqual(user.email, expected)

    def test_new_user_invalid_email(self):
        """Test creating user with no email raises error."""
        with self.assertRaises(ValueError):
            get_user_model().objects.create_user(email=None, password="testpass123")

    def test_create_superuser(self):
        """Test creating a superuser."""
        user = get_user_model().objects.create_superuser(
            email="test@example.com", password="testpass123"
        )
        self.assertTrue(user.is_superuser)
        self.assertTrue(user.is_staff)
        self.assertEqual(user.email, "test@example.com")
        self.assertTrue(user.check_password("testpass123"))

    def test_create_user_with_short_password(self):
        """Test creating a user with a short password raises error."""
        with self.assertRaises(ValueError):
            get_user_model().objects.create_user(
                email="test@example.com", password="testpass123"
            )
