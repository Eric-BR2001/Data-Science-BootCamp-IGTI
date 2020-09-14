import scrapy

from desafioModulo2GovBR.items import ScrapperGovbrItem

'''
Atividade 3:
Utilizando a linguagem Python e o pacote Scrapy, crie um projeto para realizar a raspagem de dados da página de notícias do governo federal e salvar em um arquivo csv. O endereço da página é: https://www.gov.br/pt-br/noticias. A Figura 1 apresenta um exemplo de como a página é organizada. As informações que devem ser raspadas da página inicial são:
- Título(s) e url da página inicial;
- Assunto de cada notícia (em destaque com o retângulo azul na Figura 1);
- Título de cada notícia (em destaque circulado em vermelho na Figura 1);
- URL de cada notícia.
'''

class ScrapygovbrSpider(scrapy.Spider):
    
    name = 'ScrapyGovBR'
    
    allowed_domains = ['https://www.gov.br/pt-br/noticias']
    start_urls = ['https://www.gov.br/pt-br/noticias/']

    def parse(self, response):
        
        item = ScrapperGovbrItem()

        item['titulo_pagina']  = response.css("title ::text").extract_first()
        item['url_pagina'] = response.url

        # Recorte do Conteúdo
        #<div id="content">
        #<div class="nitf-basic-tile tile-content">
        #<p class="tile-subtitle">
        #//div[@class='nitf-basic-tile tile-content']/p[@class='tile-subtitle']
        
        conteudos = response.xpath(".//div[@class='nitf-basic-tile tile-content']")
        print(conteudos)
        
        item['assunto_noticia'] = []
        item['titulo_noticia'] = []
        item['url_noticia'] = []      
        
        for conteudo in conteudos:
            print(conteudo)
            assunto = conteudo.xpath("./p[@class='tile-subtitle']")
            print(assunto)
            item['assunto_noticia'].append(''.join(assunto.xpath('text()').get()))
            noticia = conteudo.xpath("./h2/a")        
            item['titulo_noticia'].append(''.join(noticia.xpath('text()').get()))       
            item['url_noticia'].append(''.join(noticia.xpath('@href').get()))
            
        yield item