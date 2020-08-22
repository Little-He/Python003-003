#!/usr/bin/env python3
#-*- coding:utf8 -*-
# @TIME     :  10:14 下午
# @FILE     : demo.py
import requests
from bs4 import BeautifulSoup as bs
import pandas as pd
import random

USER_AGENT_LIST=[
    'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'
    "Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1062.0 Safari/536.3",
    "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1062.0 Safari/536.3",
    "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; 360SE)",
    "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1061.1 Safari/536.3",
    "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1061.1 Safari/536.3",
    "Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1061.0 Safari/536.3",
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.24 (KHTML, like Gecko) Chrome/19.0.1055.1 Safari/535.24",
    "Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/535.24 (KHTML, like Gecko) Chrome/19.0.1055.1 Safari/535.24"
]

user_agent = random.choice(USER_AGENT_LIST)

header = {'User-Agent':user_agent}

#网络请求
url = "https://maoyan.com/films?showType=3"

response = requests.get(url=url,headers=header)

print(response.status_code,response.text)

bs_info = bs(response.text,"html.parser")

#本地调试
# file = "/Users/hepenghui/Desktop/1.htm";
# with open(file,"r") as f:
#     bs_info = bs(f.read(),"html.parser")

#遍历数据
mylist = []
i = 0
for movies in bs_info.find_all("div",attrs={"class": "movie-item"}):
    if i > 9:
        break
    i += 1
    movie_hover_title = movies.find_all("div",attrs={"class":"movie-hover-title"})
    movie_name = movie_hover_title[0].find("span").text
    movie_type = list(movie_hover_title[1].children)[2].strip()
    movie_date = list(movie_hover_title[3].children)[2].strip()
    mylist.append([movie_name,movie_type,movie_date])

#写入数据
data = pd.DataFrame(data=mylist)

data.to_csv('./movie.csv',encoding='utf-8',index=False,header=["name","type","date"])

print("ok")


