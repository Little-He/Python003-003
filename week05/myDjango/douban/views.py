from django.shortcuts import render

# Create your views here.

from django.shortcuts import render
from django.http import HttpResponse
from .models import Comment

def index(request):
    return HttpResponse("index")

def comment(request,**kwargs):
    num = Comment.objects.all().count()
    print(num)

    return HttpResponse(kwargs["movie_id"])
