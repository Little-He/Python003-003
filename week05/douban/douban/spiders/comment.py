# -*- coding: utf-8 -*-
import scrapy
import requests
from scrapy.selector import Selector
from ..items import DoubanItem


class CommentSpider(scrapy.Spider):
    name = 'comment'
    allowed_domains = ['douban.com']
    start_urls = ['https://movie.douban.com/']

    # def start_requests(self):
    #     url = "https://movie.douban.com/subject/30128916/comments?status=P"
    #     ua = UserAgent(verify_ssl=False, use_cache_server=False)
    #     header = {"User-Agent" : ua.random}
    #     yield scrapy.Request(url, callback=self.parse,headers=header)

    def parse(self, response):
        items = []
        startDict = {"很差" : 1,"较差" : 2,"还行" : 3, "推荐": 4 ,"力荐" : 5}
        # 网络请求
        # comment_list = Selector(text=response.text).xpath('//div[contains(@class,"comment-item")]')

        # 本地调试
        file = "/Users/hepenghui/Desktop/30128916.htm"
        with open(file) as f:
            comment_list = Selector(text=f.read()).xpath('//div[contains(@class,"comment-item")]')

        for one in comment_list:
            content = one.xpath('./div/p/span[@class="short"]/text()').extract_first()
            cid = one.xpath('./@data-cid').extract_first()
            username = one.xpath('./div/h3/span[2]/a/text()').extract_first()
            pdate = one.xpath('./div/h3/span[2]/span[3]/@title').extract_first()
            starttitle = one.xpath('./div/h3/span[2]/span[2]/@title').extract_first()
            start = startDict.get(starttitle)
            item = DoubanItem()
            item["content"] = content
            item["cid"] = cid
            item["username"] = username
            item["pdate"] = pdate
            item["startitle"] = starttitle
            item["star"]   = start
            items.append(item)

        return items




