#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import requests
from fake_useragent import UserAgent

try:
    login_url = "https://shimo.im/lizard-api/auth/password/login"
    pre_login = 'https://shimo.im/login?from=home'

    ua = UserAgent(verify_ssl=False,use_cache_server=False)
    header = {
        "User-Agent" : ua.random,
        "Referer" : pre_login,
        "Origin" : "https://shimo.im",
        "x-requested-with" : "XmlHttpRequest"
    }

    form_data = {
        "email" : "laohe0315@163.com",
        "mobile" : "+86undefined",
        "password" : "123456789"
    };

    s = requests.Session()

    # post数据前获取cookie,CSRF数据
    pre_resp = s.get(pre_login, headers=header)
    #print(pre_resp.cookies)

    response = s.post(login_url,data=form_data,headers=header,cookies=pre_resp.cookies)
    print(response.text)
except Exception as err:
    print(err)

