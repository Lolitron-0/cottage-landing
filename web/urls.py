from django.urls import path
from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("get_house/", views.get_house, name="get_house")
]