# -*- coding: utf-8 -*-
"""
Created on Mon Aug 3 00:32:58 2020

@author: Nelson Dressler
"""

import scrapy

# Para executar, use o prompt de comando do Anaconda e execute o seguinte comando:
# scrapy runspider scrapingIGTIBlog.py -t json -o dados/artigos.json
# ou
# scrapy runspider scrapingIGTIBlog.py -t csv -o dados/artigos.csv

class Itens(scrapy.Item):
    # Para cada artigo da página
    categoria = scrapy.Field()
    categoriaURL = scrapy.Field()
    titulo = scrapy.Field()
    url = scrapy.Field()
    dtPostagem = scrapy.Field()
    comentarios = scrapy.Field()
    visualizacoes = scrapy.Field()

class IGTIBlogSpider(scrapy.Spider):

    name = 'Scraping IGTI Blog'

    # A página alvo da nossa raspagem é https://www.igti.com.br/blog/

    def __init__(self, tag=None):
        self.start_urls = ['https://www.igti.com.br/blog/']
    
    def parse(self, response):
        self.log(f'Acessando a URL: {response.url}')

        artigos = response.xpath("//article")
        count = 0
        self.log(f'Total de artigos em destaque: {len(response.css("article"))}')

        for artigo in artigos:
            item = Itens()
            count += 1
            #print(f'Artigo nº {count}')

            categorias = artigo.xpath(".//div/div[@class='entry-category']/a") #o . significa que as divs serão buscadas dentro das tags de artigo (article)

            if len(categorias) == 1:
                item['categoria'] = ''.join(categorias.xpath('text()').extract())
                item['categoriaURL'] = ''.join(categorias.xpath('@href').extract())
            else:
                cat = []
                catUrl = []
                for categoria in categorias:
                    cat.append(''.join(categoria.xpath('text()').extract()))
                    cat.append(', ')
                    catUrl.append(''.join(categoria.xpath('@href').extract()))
                    catUrl.append(', ')
                item['categoria'] = ''.join(cat)
                item['categoriaURL'] = ''.join(catUrl)
            
            # print(f'Categoria: {item["categoria"]}')
            # print(f'Categoria URL: {item["categoriaURL"]}')

            titulo = artigo.xpath(".//h2[@class='entry-title h3']/a")

            item['titulo'] = ''.join(titulo.xpath('text()').extract())
            item['url'] = ''.join(titulo.xpath('@href').extract())
            # print(f'Título: {item["titulo"]}')
            # print(f'URL: {item["url"]}')

            metadata = artigo.xpath(".//div/div[@class='entry-meta']")
            data = metadata.xpath(".//div[@class='meta-item meta-date']/span[@class='updated']")
            item['dtPostagem'] = ''.join(data.xpath('text()').get())
            # print(f'Data da postagem: {item["dtPostagem"]}')

            comentario = metadata.xpath(".//div[@class='meta-item meta-comments']/a/span[@class='dsq-postid']")
            item['comentarios'] = ''.join(comentario.xpath('text()').get())
            # print(f'Quantidade de comentários: {item["comentarios"]}')

            visao = metadata.xpath(".//div[@class='meta-item meta-views']")
            item['visualizacoes'] = ''.join(visao.xpath('text()').get())
            # print(f'Quantidade de visualizações: {item["visualizacoes"]}')

            # Retorno do método
            yield item #gera um objeto
        
        self.log(f'Artigos raspados: {count}')

        self.log('FIM DA RASPAGEM!')