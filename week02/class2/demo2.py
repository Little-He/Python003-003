#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from selenium import webdriver
import time

try:
    executable_path = "/Users/chehang168/Desktop/chromedriver"
    browser = webdriver.Chrome(executable_path=executable_path)

    #打开首页
    browser.get("https://shimo.im/welcome")
    time.sleep(1)

    #点击跳转按钮
    browser.find_element_by_xpath('//*[@id="homepage-header"]/nav/div[3]/a[2]').click()
    time.sleep(1)

    #输入登录信息，登录
    browser.find_element_by_name("mobileOrEmail").send_keys("laohe0315@163.com")
    browser.find_element_by_name("password").send_keys("123456789")
    time.sleep(1)
    browser.find_element_by_class_name("submit").click()

    cookies = browser.get_cookies()
    print(cookies)
    time.sleep(3)
except Exception as err:
    print(err)
finally:
    browser.close()