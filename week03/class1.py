#!/usr/bin/env python3
#-*- coding:utf8 -*-
# @TIME     :  8:38 下午
# @FILE     : class1.py
import threading
import time
import random

class DiningPhilosophers(threading.Thread):
    def __init__(self,name,limit,leftLock,rightlock):
        super().__init__()
        self.name = name
        self.limit = limit
        self.leftlock = leftLock
        self.rightlock = rightlock
        self.eatTime = 0

    def run(self) -> None:
        while self.eatTime < self.limit:
            self.think()
            self.eat()

    def timesleep(self):
        time.sleep(random.randint(0, 5))

    def think(self):
        print(f"{self.name}正在思考")
        self.timesleep()

    def eat(self):
        if self.pickLeftFork() and self.pickRightFork():
            print(f"{self.name}正在吃饭")
            self.eatTime += 1
            records.append([self.name,0,3])
            self.timesleep()
            self.putLeftFork()
            self.putRightFork()

    def pickLeftFork(self):
        # self.leftlock.acquire()
        self.leftlock.picklock()
        print(f"{self.name}拿起了左叉子")
        records.append([self.name,1,1])
        return True

    def pickRightFork(self):
        #self.rightlock.acquire()
        self.rightlock.picklock()
        print(f"{self.name}拿起了右叉子")
        records.append([self.name,2,1])
        return True

    def putLeftFork(self):
        #self.leftlock.release()
        self.leftlock.putlock()
        print(f"{self.name}放下了左叉子")
        records.append([self.name,1,2])

    def putRightFork(self):
        # self.rightlock.release()
        self.rightlock.putlock()
        print(f"{self.name}放下了右叉子")
        records.append([self.name,2,2])

class Fork():
    def __init__(self):
        self._lock = threading.Lock()

    def picklock(self):
        self._lock.acquire()

    def putlock(self):
        self._lock.release()


if __name__ == "__main__":
    records = []
    #吃饭次数
    limit = 1
    # 5个叉子的锁
    # fork_0 = threading.Lock()
    # fork_1 = threading.Lock()
    # fork_2 = threading.Lock()
    # fork_3 = threading.Lock()
    # fork_4 = threading.Lock()

    forks = [Fork() for _ in range(5)]

    # p_0 = DiningPhilosophers(0,limit,fork_0,fork_1)
    # p_1 = DiningPhilosophers(1,limit,fork_1,fork_2)
    # p_2 = DiningPhilosophers(2,limit,fork_2,fork_3)
    # p_3 = DiningPhilosophers(3,limit,fork_3,fork_4)
    # p_4 = DiningPhilosophers(4,limit,fork_4,fork_0)

    phers = [DiningPhilosophers(i,limit,forks[i],forks[(i+1)%5]) for i in  range(5)]

    # p_0.start()
    # p_1.start()
    # p_2.start()
    # p_3.start()
    # p_4.start()
    #
    # p_0.join()
    # p_1.join()
    # p_2.join()
    # p_3.join()
    # p_4.join()

    for p in phers:
        p.start()

    for p in phers:
        p.join()

    print(records)




