import scrapy

from desafioModulo2GovBR.items import CrawlerGovBrItem

'''
Atividade 4:
Utilizando Python e Scrapy, altere o projeto da atividade 3 para realizar o rastreamento para as notícias selecionadas na página inicial. A Figura 2 abaixo apresenta um exemplo de como uma página de notícia é organizada. As informações, em destaque na Figura 2, que devem ser raspadas das páginas de cada notícia são:
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

class CrawlergovbrSpider(scrapy.Spider):
    
    name = 'CrawlerGovBR'
    
    # allowed_domains = ['https://www.gov.br/pt-br/noticias']
    start_urls = ['https://www.gov.br/pt-br/noticias/']

    def parse(self, response):
        
        self.log('Acessando a URL INICIAL: %s' % response.url)      
        item = CrawlerGovBrItem()

        item['titulo_pagina']  = response.css("title ::text").extract_first()
        item['url_pagina'] = response.url

        # Recorte do Conteúdo
        #<div id="content">
        #<div class="nitf-basic-tile tile-content">
        #<p class="tile-subtitle">
        #//div[@class='nitf-basic-tile tile-content']/p[@class='tile-subtitle']
        
        conteudos = response.xpath(".//div[@class='nitf-basic-tile tile-content']")
        #print(conteudos)
                
        for conteudo in conteudos:
            noticia = conteudo.xpath("./h2/a")
            #url = ''.join(noticia.xpath('@href').get())
            url = noticia.xpath('@href').extract_first()
            print('Follow %s' % url)

            yield response.follow(url, self.parse_noticia)                    

        yield item
    
    def parse_noticia(self, response):
        self.log('Acessando a URL SECUNDÁRIA: %s' % response.url)

        item = CrawlerGovBrItem()        
        item['titulo_pagina']  = response.css("title ::text").extract_first()
        item['url_pagina'] = response.url

        artigo = response.xpath(".//article")

        item['url_noticia'] = response.url     

        assunto = artigo.xpath("./p[@class='nitfSubtitle']")        
        item['assunto_noticia']  =  assunto.xpath('text()').get()

        titulo = artigo.xpath("./h1[@class='documentFirstHeading']")     
        item['titulo_noticia'] = titulo.xpath('text()').get()
        print('Notícia: %s' % item['titulo_noticia'])

        subtitulo = artigo.xpath("./div[@class='documentDescription']")
        item['subtitulo_noticia'] = subtitulo.xpath('text()').get()


        data = artigo.xpath(".//span[@class='documentPublished']/span[@class='value']")    
        item['publicacao_noticia'] =  data.xpath('text()').get()

        categoria = artigo.xpath("./div[@id='formfield-form-widgets-categoria']/span[@id='form-widgets-categoria']/div/a")
        item['categoria_noticia'] = categoria.xpath('text()').get()

        autor = artigo.xpath(".//span[@class='discreet']/a[@class='external-link']")
        item['autor_noticia'] = autor.xpath('text()').get()

        textos = artigo.xpath(".//div[@id='content-core']/div[@id='parent-fieldname-text']/div/p")
        print('Número de paragrafos: %s' % len(textos))
        item['texto_noticia'] = textos.xpath('text()').extract()

        item['tag_noticia'] = []
        tags = response.xpath(".//div[@id='content']/div[@class='column']/div[@id='category']/a[@class='link-category']")
        i = 0
        while i < len(tags):
            item['tag_noticia'].append(''.join(tags.xpath('text()')[i].get()))
            i = i+1
                    
        yield item