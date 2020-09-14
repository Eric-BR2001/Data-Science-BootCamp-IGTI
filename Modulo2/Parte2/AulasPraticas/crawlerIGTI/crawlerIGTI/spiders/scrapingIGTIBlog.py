import scrapy

from crawlerIGTI.items import ScrapperIGTIItem

class ScrapingigtiblogSpider(scrapy.Spider):
    name = 'scrapingIGTIBlog'
    
    # allowed_domains = ['www.igti.com.br/blog/']
    # start_urls = ['http://www.igti.com.br/blog/']

    def __init__(self):
        self.start_urls = ['https://www.igti.com.br/blog/']

    def parse(self, response):
        self.log(f'Acessando a URL: {response.url}')

        item = ScrapperIGTIItem()

        item['titulo_pagina'] = response.css("title::text").extract_first()
        item['url_pagina'] = response.url

        articles = response.xpath("//article")
        count_article = 0
        self.log(f'Total de artigos em destaque: {len(response.css("article"))}')

        for article in articles:
            count_article += 1
            self.log(f'Artigo nº {count_article}')

            categories = article.xpath(".//div/div[@class='entry-category']/a") #o . significa que as divs serão buscadas dentro das tags de artigo (article)
            # print(f'Quantidade de categorias: {len(categories)}')

            if len(categories) == 1:
                item['categoria_artigo'] = ''.join(categories.xpath('text()').get())
                item['categoria_URL'] = ''.join(categories.xpath('@href').get())
            elif len(categories) > 1:
                item['categoria_artigo'] = []
                item['categoria_URL'] = []
                i = 0
                while i < len(categories):
                    item['categoria_artigo'].append(''.join(categories.xpath('text()')[i].get()))
                    item['categoria_URL'].append(''.join(categories.xpath('@href')[i].get()))
                    i += 1

            # print(f'Categoria: {item["categoria_artigo"]}')
            # print(f'Categoria URL: {item["categoria_URL"]}')
            # print(f'Type(item[categoria_url]): {type(item["categoria_URL"])}')

            title = article.xpath(".//h2[@class='entry-title h3']/a")

            item['titulo_artigo'] = ''.join(title.xpath('text()').extract())
            item['url_artigo'] = ''.join(title.xpath('@href').extract())
            # print(f'Título: {item["titulo_artigo"]}')
            # print(f'URL: {item["url_artigo"]}')

            metadata = article.xpath(".//div/div[@class='entry-meta']")
            data = metadata.xpath(".//div[@class='meta-item meta-date']/span[@class='updated']")
            item['dtPostagem_artigo'] = ''.join(data.xpath('text()').get())
            # print(f'Data da postagem: {item["dtPostagem_artigo"]}')

            comments = metadata.xpath(".//div[@class='meta-item meta-comments']/a/span[@class='dsq-postid']")
            item['comentarios_artigo'] = ''.join(comments.xpath('text()').get())
            # print(f'Quantidade de comentários: {item["comentarios_artigo"]}')

            views = metadata.xpath(".//div[@class='meta-item meta-views']")
            item['visualizacoes_artigo'] = ''.join(views.xpath('text()').get())
            # print(f'Quantidade de visualizações: {item["visualizacoes_artigo"]}')

            # Retorno do método
            yield item #gera um objeto
        
        # self.log(f'Artigos raspados: {count_article}')

        # self.log('FIM DA RASPAGEM!')
