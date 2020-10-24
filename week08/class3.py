#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import random
import time
from functools import wraps

def timer(func):
    @wraps(func)
    def innser(*args,**kwargs):
        stime = time.time()
        res = func(*args,**kwargs)
        etime = time.time()
        print(f'{func.__name__} run {etime - stime} s')
        return res
    return innser

class Timer(object):
    def __init__(self,*args, **kwargs):
        super(Timer,self).__init__(*args,**kwargs)

    def __call__(self, func):
        @wraps(func)
        def innser(*args, **kwargs):
            stime = time.time()
            res = func(*args, **kwargs)
            etime = time.time()
            print(f'{func.__name__} run {etime - stime} s')
            return res
        return innser


@timer
def func():
    s = random.randint(1,5)
    time.sleep(s)
    print(f"rest {s} s")

func()
print(func.__name__)

@Timer()
def func1():
    s = random.randint(1, 5)
    time.sleep(s)
    print(f"rest {s} s")

func1()
print(func1.__name__)