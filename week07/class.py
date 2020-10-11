#!/usr/bin/env python3
#-*- coding:utf8 -*-
# @TIME     :  5:15 下午
# @FILE     : class.py
from abc import ABCMeta,abstractmethod

class Animal(object):

    @abstractmethod
    def __init__(self,type_,physique,character):
        '''
        :param type_: 类型
        :param physique: 体型
        :param character: 性格
        '''
        self.type = type_
        self.physique = physique
        self.character = character

    @property
    def is_fierce(self):
        return self.type == "食肉" \
            and self.physique >= "中等" \
            and self.character == "凶猛"

    @property
    def is_pet(self):
        return self.character != "凶猛"

class Cat(Animal):

    def __init__(self,name,type_,physique,character):
        super().__init__(type_,physique,character)
        self.name = name

    @property
    def sound(self):
        return "喵喵"

class Dog(Animal):

    def __init__(self,name,type_,physique,character):
        super().__init__(type_,physique,character)
        self.name = name

    @property
    def sound(self):
        return "汪汪"

class Zoo(object):

    def __init__(self,name):
        self.name = name
        self._animals = set()

    def add_animal(self,animal:Animal):
        class_name = animal.__class__.__name__
        if class_name in self._animals :
            print(f"{class_name} ({animal.name}) is already exists ！")
        else:
            self._animals.add(class_name)
            setattr(self,class_name,class_name)


if __name__ == "__main__" :
    # 实例化一只猫，属性包括名字、类型、体型、性格
    cat1 = Cat('大花猫 1', '食肉', '小', '温顺')
    # print(cat1.is_pet)
    # print(cat1.is_fierce)
    # print(cat1.sound)
    cat2 = Cat('大花猫 2', '食肉', '小', '温顺')

    z = Zoo('时间动物园')
    z.add_animal(cat1)
    z.add_animal(cat2)

    # 动物园是否有猫这种动物
    have_cat = hasattr(z, 'Cat')
    print(have_cat)
