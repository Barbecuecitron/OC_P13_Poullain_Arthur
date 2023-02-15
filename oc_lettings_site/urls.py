from django.contrib import admin
from django.urls import path, include


def test():
    division = 1 / 0


urlpatterns = [
    path("", include("home.urls")),
    path("lettings/", include("lettings.urls")),
    path("profiles/", include("profiles.urls")),
    path("admin/", admin.site.urls),
    path("test", test),
]
