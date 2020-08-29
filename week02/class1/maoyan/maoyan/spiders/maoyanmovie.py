# -*- coding: utf-8 -*-
import scrapy
import requests
from scrapy.selector import Selector
from ..items import MaoyanItem


class MaoyanmovieSpider(scrapy.Spider):
    name = 'maoyanmovie'
    allowed_domains = ['maoyan.com']
    start_urls = ['http://maoyan.com/']

    def parse(self, response):
        items = []
        # 网络请求
        # url = "https://maoyan.com/films?showType=3"
        # response = requests.get(url=url)
        # print(response.status_code, response.text)
        # movie_hover_title_list = Selector(text=f.read()).xpath('//div[@class="movie-item-hover"]')

        # 本地调试
        file = "/Users/hepenghui/Desktop/1.htm";
        with open(file, "r") as f:
            # movie_hover_title_list = [Selector(text=f.read()).xpath(f'//div[@class="movie-item-hover"][{i}]') for i in range(1,11)]
            movie_hover_title_list = Selector(text=f.read()).xpath('//div[@class="movie-item-hover"]')

        i = 0
        for movie_hover_title in movie_hover_title_list:
            if i > 9:
                break
            movie_name = movie_hover_title.xpath("./a/div/div[1]/span/text()").extract_first()
            movie_type = movie_hover_title.xpath("./a/div/div[2]/text()").extract()[1].strip()
            movie_date = movie_hover_title.xpath("./a/div/div[4]/text()").extract()[1].strip()
            item = MaoyanItem()
            item["movie_name"] = movie_name
            item["movie_type"] = movie_type
            item["movie_date"] = movie_date
            items.append(item)
            i += 1
        return items
