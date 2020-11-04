#!/usr/bin/env python3
#-*- coding:utf8 -*-
# @TIME     :  8:28 下午
# @FILE     : urls.py
from django.urls import path,re_path
from . import views

urlpatterns = [
    path('',views.index),
    path('login',views.login),
    path("<str:comment>/<int:movie_id>.html",views.comment),
    path("<str:comment>/q=<str:kw>",views.search)
]