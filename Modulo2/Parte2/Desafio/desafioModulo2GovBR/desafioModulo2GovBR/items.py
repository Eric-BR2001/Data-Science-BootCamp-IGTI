# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy

class ScrapperGovbrItem(scrapy.Item):
    # define the fields for your item here like:
    '''
    - Título(s) e url da página inicial;
    
    - Assunto de cada notícia (em destaque com o retângulo azul na Figura 1);
    - Título de cada notícia (em destaque circulado em vermelho na Figura 1);
    - URL de cada notícia.
    '''
    url_pagina = scrapy.Field()
    titulo_pagina = scrapy.Field()
    
    assunto_noticia = scrapy.Field()
    titulo_noticia = scrapy.Field()
    url_noticia = scrapy.Field()

class CrawlerGovBrItem(scrapy.Item):
    # define the fields for your item here like:
    '''
    - Título(s) da página;
    - Url da página;

    - Assunto de cada notícia;
    - Título de cada notícia;
    - Subtítulo de cada notícia;
    - Data/hora da publicação;
    - Texto de cada notícia;
    - Autor da notícia;
    - Categoria da notícia;
    - Tags da notícia.
    '''
    url_pagina = scrapy.Field()
    titulo_pagina = scrapy.Field()

    url_noticia = scrapy.Field()
    assunto_noticia = scrapy.Field()
    titulo_noticia = scrapy.Field()
    subtitulo_noticia = scrapy.Field()
    publicacao_noticia = scrapy.Field()
    texto_noticia = scrapy.Field()
    autor_noticia = scrapy.Field()
    categoria_noticia = scrapy.Field()
    tag_noticia = scrapy.Field()