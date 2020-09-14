# -*- coding: utf-8 -*-
"""
Created on Mon Aug 3 00:06:36 2020

@author: Nelson Dressler
"""

import scrapy

class SpiderMinimo(scrapy.Spider):
    """Scrapy spider mínimo"""

    name = 'minimo'

    start_urls = ['https://www.igti.com.br', 'https://www.igti.com.br/blog/']
    
    # Função de callback com a resposta (response)
    def parse(self, response):
        self.log('Acessando a URL: %s' % response.url)

# Pra executar, deve-se executar o seguinte comando no cmd: scrapy runspider spiderMinimoEnxutoIGTI.py