from django.shortcuts import render
from django.db.models import Q

# Create your views here.

from django.shortcuts import render
from django.http import HttpResponse
from .models import Comment
from .form import LoginForm
from django.contrib.auth import  authenticate,login

def index(request):
    # return HttpResponse("index")
    content = "This is index page"
    print(content)
    return render(request,"index.html",locals())

def login(request) :
    if request.method == "POST":
        print(request.POST)
    if request.method == "GET":
        login_form = LoginForm()
        return  render(request,"login.html",{'form': login_form})


def comment(request,**kwargs):
    total = Comment.objects.all().count()
    list = Comment.objects.filter(star__gt=3)
    return render(request,"comment.html",locals())

def search(request,**kwargs):
    kw = kwargs["kw"]

    list = Comment.objects.filter(Q(content__icontains=kw)|Q(username__icontains=kw))
    total = list.count()
    return render(request,"search.html",locals())