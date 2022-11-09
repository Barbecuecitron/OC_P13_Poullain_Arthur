from django.test import TestCase
from django.urls import reverse

# # Create your tests here.
class HomeIndexTest(TestCase):
    def test_index(self):
        response = self.client.get(reverse("index"))
        assert response.status_code == 200
        assert b"<title>Holiday Homes</title>" in response.content
        assert b"<h1>Welcome to Holiday Homes</h1>" in response.content
