from django.shortcuts import render

# Create your views here.

from django.shortcuts import render
from django.http import HttpResponse
from .models import Comment
from datetime import date

def index(request):
    # return HttpResponse("index")
    content = "This is index page"
    print(content)
    return render(request,"index.html",locals())

def comment(request,**kwargs):

    total = Comment.objects.all().count()

    list = Comment.objects.filter(star__gt=3)
    print(list[0].pdate.strftime('%Y-%m-%d %H:%M:%S'))
    return render(request,"comment.html",locals())
