from django.shortcuts import render
from django.db.models import Q

# Create your views here.

from django.shortcuts import render
from django.http import HttpResponse
from .models import Comment
from .form import LoginForm
from django.contrib.auth import  authenticate,login
from django.utils.http import urlquote

def index(request):
    # return HttpResponse("index")
    content = "This is index page"
    print(content)
    return render(request,"index.html",locals())

def userlogin(request) :
    if request.method == "POST":
        login_from = LoginForm(request.POST)
        if login_from.is_valid():
            data = login_from.cleaned_data
            user = authenticate(username=data["username"],password=data["password"])
            if (user):
                login(request,user)
                return HttpResponse("登录成功")
            else:
                return HttpResponse("登录失败")

    if request.method == "GET":
        login_form = LoginForm()
        callback = urlquote(request.META["HTTP_REFERER"])
        return  render(request,"login.html",{'form': login_form,'callback':callback})

def userloginout(request):
    pass

def comment(request,**kwargs):
    total = Comment.objects.all().count()
    list = Comment.objects.filter(star__gt=3)
    print(request.get_full_path())
    return render(request,"comment.html",locals())

def search(request,**kwargs):
    kw = kwargs["kw"]

    list = Comment.objects.filter(Q(content__icontains=kw)|Q(username__icontains=kw))
    total = list.count()
    return render(request,"search.html",locals())