# path("profiles/", views.profiles_index, name="profiles_index"),
# path("profiles/<str:username>/", views.profile, name="profile"),
from django.urls import path

# from oc_lettings_site.profiles import views
# from .views import profile, profiles_index
from . import views

urlpatterns = [
    path("", views.profiles_index, name="profiles_index"),
    path("<str:username>/", views.profile, name="profile"),
    # path("charge/", credit_views.charge),
]
