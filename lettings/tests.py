# def test_dummy():
#     assert 1
from django.test import TestCase
from django.urls import reverse, reverse_lazy
from .models import Address, Letting


class LettingsTest(TestCase):
    def setUp(self):
        self.address = Address.objects.create(
            number=4,
            street="Rue de la Gloire",
            city="St-Martin De La Lieue",
            state="FR",
            zip_code=14100,
            country_iso_code="FRA",
        )
        self.letting = Letting.objects.create(title="Test Letting FRA", address=self.address)

    def test_lettings_index(self):
        response = self.client.get(reverse("lettings_index"))
        assert response.status_code == 200
        assert b"<title>Lettings</title>" in response.content

    def test_letting_caracs(self):
        response = self.client.get(reverse("letting", args=[1]))
        assert response.status_code == 200
        assert b"4 Rue de la Gloire" in response.content
        assert b"<title>Test Letting FRA</title>" in response.content

    def test_lettings_models_str(self):
        assert str(self.address) == f"{self.address.number} {self.address.street}"
        assert str(self.letting) == self.letting.title
