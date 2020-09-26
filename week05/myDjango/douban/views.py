from django.shortcuts import render

# Create your views here.

from django.shortcuts import render
from django.http import HttpResponse
from . import models

def index(request):
    return HttpResponse("index")

def comment(request,**kwargs):

    return HttpResponse(kwargs["id"])
