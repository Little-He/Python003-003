# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html
import scrapy
import pymysql
from scrapy.exceptions import NotConfigured

class DoubanPipeline:

    def __init__(self,db_conf):
        try:
            self.conn = pymysql.connect(db_conf["host"],db_conf["user"],db_conf["pwd"],db_conf["db"])
            self.cursor = self.conn.cursor()
            print("db connect open","------------")
        except Exception as err:
            print(err)

    @classmethod
    def from_crawler(cls,crawler):
        db_conf = crawler.settings.getdict("DB_CONF")
        if not db_conf:
            raise NotConfigured
        return cls(db_conf)

    def process_item(self, item, spider):
        try:
            sql = "INSERT INTO comment(`content`,`star`,`username`,`pdate`) VALUES(%s,%s,%s,%s)"
            self.cursor.execute(sql,(item["content"],item["star"],item["username"],item["pdate"]))
            self.conn.commit()
            newId = self.cursor.lastrowid
            print(f"insert ok id = {newId}")
        except Exception as err :
            print("insert fail err = %s" % (str(err),))

        return item

    def close_spider(self,spider):
        print("db content close","++++++++++++++++++",spider)
        self.conn.close()
