# -*- coding: utf-8 -*-
"""
Created on Sun Aug 2 23:58:02 2020

@author: Nelson Dressler
"""

import scrapy

class SpiderMinimo(scrapy.Spider):
    """Scrapy spider mínimo"""

    name = 'minimo'

    # Função de requisição (request) à URL 
    def start_requests(self):
        # URL que será raspada ou rastreada
        url = 'https://www.igti.com.br/blog/'
        return [scrapy.Request(url)]
    
    # Função de callback com a resposta (response)
    def parse(self, response):
        self.log('Acessando a URL: %s' % response.url)

# Pra executar, deve-se executar o seguinte comando no cmd: scrapy runspider spiderMinimoIGTI.py