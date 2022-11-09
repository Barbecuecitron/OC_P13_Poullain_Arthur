# from django.test import TestCase

# Create your tests here.
from django.contrib.auth.models import User
from django.test import TestCase
from django.urls import reverse

from .models import Profile


class ProfilesTest(TestCase):
    def setUp(self):
        self.user = User.objects.create_user(
            username="MrTest", password="niceP@ssword576", email="MrTest@email.com"
        )
        self.profile = Profile.objects.create(user=self.user, favorite_city="Lisieux")

    def test_profiles_index(self):
        response = self.client.get(reverse("profiles_index"))
        assert response.status_code == 200
        assert b"<title>Profiles</title>" in response.content

    def test_profile_detail(self):
        response = self.client.get(reverse("profile", args=["MrTest"]))
        assert response.status_code == 200
        assert b"<title>MrTest</title>" in response.content

    def test_profiles_models_str(self):
        assert str(self.profile) == self.user.username
