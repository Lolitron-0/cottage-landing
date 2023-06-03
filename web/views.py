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
    house_set = House.objects.filter(id=int(id))
    house_obj = house_set[0]
    house_dict = list(house_set.values())[0]
    return JsonResponse({'house': house_dict, 'images': list([obj.image.url for obj in house_obj.image_set.all().order_by("-isPreview", "-priority")])})

