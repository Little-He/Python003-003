#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# 兼容add函数...
def newmap(func,*iter):
    newiter = zip(*iter)
    for i in newiter:
        yield func(*i)



def func(x):
    return x*2
def add(x,y):
    return x + y

l = [x for x in range(0,11)]
l1 = [x for x in range(100,111)]
print(l)
l2 = map(func,l) # 返回一个可可迭代对象
print(list(l2))
l3 = map(add,l,l1)
print(list(l3))
# 返回一个可可迭代对象
# print(l1)

new_l = newmap(func,l)
new_l3 = newmap(add,l,l1)
print(list(new_l3))


