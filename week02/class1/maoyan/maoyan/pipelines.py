# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html
import pymysql
from scrapy.exceptions import NotConfigured

class MaoyanPipeline:

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
            sql = "INSERT INTO maoyanmovie(`name`,`type`,`pdate`) VALUES(%s,%s,%s)"
            self.cursor.execute(sql,(item["movie_name"],item["movie_type"],item["movie_date"]))
            self.conn.commit()
            newId = self.cursor.lastrowid
            print(f"insert ok id = {newId}")
        except Exception as err :
            print("insert fail err = %s" % (str(err),))
        return item

    def close_spider(self,spider):
        print("db content close","++++++++++++++++++",spider)
        self.conn.close()
