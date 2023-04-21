from django.http import HttpResponse, JsonResponse
from django.template import loader
from django.shortcuts import render

from .models import House


def index(request):
    template = loader.get_template("index.html")
    context = {
        'houses': House.objects.all(),
    }
    return HttpResponse(template.render(context, request))


def get_house(request):
    id = request.headers.get('houseId')
    house = House.objects.filter(id=int(id)).values()
    return JsonResponse({'house': list(house)[0]})

