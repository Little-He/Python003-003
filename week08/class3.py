#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import random
import time

def timer(func):
    def innser(*args,**kwargs) :
        stime = time.time()
        res = func(*args,**kwargs)
        etime = time.time()
        print(f'{func.__name__} run {etime - stime} s')
        return res
    return innser

class Timer(object):
    def __init__(self,func):
        self.__func = func

    def __call__(self, *args, **kwargs):
        stime = time.time()
        res = self.__func(*args, **kwargs)
        etime = time.time()
        print(f'{self.__func.__name__} run {etime - stime} s')
        return res


@timer
def func():
    s = random.randint(1,5)
    time.sleep(s)
    print(f"rest {s} s")

func()

@Timer
def func1():
    s = random.randint(1, 5)
    time.sleep(s)
    print(f"rest {s} s")

func1()