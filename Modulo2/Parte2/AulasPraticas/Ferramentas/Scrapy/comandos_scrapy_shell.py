import scrapy

class AliexpressTabletsSpider(scrapy.Spider):
    name = 'blog_igti'
    allowed_domains = ['igti.com']
    start_urls = ['https://www.igti.com.br/blog/']


    def parse(self, response): #Comandos válidos para executar dentro do scrapy shell
        # Comando no cmd: scrapy shell https://www.igti.com.br/blog/
        # Retornando a URL pesquisada no scraping
        response.url

        # Retornando os cabeçalhos HTML da página de scraping
        response.headers

        # Retornando o corpo HTML da página
        response.body

        # Consultando as tags title da página
        response.xpath('//title')

        # Consultando as tags title da página
        response.css('title')

        # Retornando a quantidade de tags title na página
        len(response.css('title'))

        # Retornando a quantidade de tags div na página
        len(response.css('div'))

        # Consultando as tags article da página
        response.xpath('//article')

        # Retornando a quantidade de tags article na página
        len(response.css('article'))

        # Consultando a primeira tag article da página
        response.xpath('//article')[0]

        # Extraindo o conteúdo da primeira tag article da página
        response.xpath('//article')[0].get()
        response.xpath('//article')[0].extract() #outro comando possível

        # Extraindo o conteúdo das tags title da página
        response.xpath('//title').get() #retorna sempre o primeiro elemento encontrado
        response.xpath('//title').extract() #retorna uma lista de elementos encontrados

        # Extraindo o conteúdo da primeira tag div dentro da tag article
        response.xpath('//article/div').get()

        # Retornando a quantidade de tags div dentro de tags article na página
        len(response.css('article div'))

        # Extraindo o conteúdo da segunda tags div dentro da taga article
        response.xpath("//article/div/div").get()

        # Consultando as tag div por uma classe específica
        response.xpath("//div[@class='entry-category']")

        # Extraindo o conteúdo da primeira tag div contendo a classe categoria
        response.xpath("//div[@class='entry-category']").get()

        # Extraindo o conteúdo da primeira tag div contendo a classe conteúdo
        response.xpath("//div[@class='entry-content']").get()

        # Consultando todos os links (tags a) dentro da tag h2 com uma classe específica e este dentro de uma div
        response.xpath("//div/h2[@class='entry-title h3']/a")

        # Extraindo o conteúdo de um link (tag a) dentro do primeiro h2 com uma classe específica e este dentro de uma div 
        response.xpath("//div/h2[@class='entry-title h3']/a").get()

        # Recebendo numa variável a primeira tag a dentro da div com a classe de categoria 
        categoria = response.xpath("//div[@class='entry-category']/a")[0]

        # Extraindo o conteúdo dessa tag
        categoria.extract()

        # Extraindo apenas o texto dessa tag
        categoria.xpath('text()').extract()

        # Extraindo apenas o link da tag
        categoria.xpath('@href').extract()

        # Recebendo numa variável todas as tags a dentro das divs com a classe de categoria
        categorias = response.xpath("//div[@class='entry-category']/a")

        # Percorrendo cada categoria e impimindo o texto e o link correspondente
        for categoria in categorias:
            txt = ''.join(categoria.xpath('text()').extract()) #concatenando todos os itens da lista através da função join
            link = ''.join(categoria.xpath('@href').extract()) #concatenando todos os itens da lista através da função join
            print(txt, "-", link)

        # Selecionando novamente a primeira tag a, filtrando a URL e navegando para este novo link
        categoria = response.xpath("//div[@class='entry-category']/a")[0]
        url = ''.join(categoria.xpath('@href').extract())
        fetch(url)
                
        # Consultando a nova URL e o novo título
        response.url() #apresentando a nova URL atual
        response.xpath("//title").extract()

        # Buscando uma página não existente
        fetch('https://igti.edu.br/blog/')
        # Resultado: 2020-08-02 21:13:24 [scrapy.core.engine] DEBUG: Crawled (404) <GET https://igti.edu.br/blog/> (referer: None)

        # Retornando à página inicial
        fetch('https://www.igti.com.br/blog/')

        # Consultando todas as segundas tags div dentro de article contendo a classe específica 
        artigos = response.xpath("//article/div/div[@class='box-inner-ellipsis']")

        # Extraindo o conteúdo da primeira ocorrência dessa lista
        artigos[0].get()

        # Recebendo o conteúdo dos artigos e extraindo e apresentando apenas o primeiro conteúdo
        conteudo = artigos.xpath("//div/div[@class='entry-content']/p")
        txt = conteudo.xpath('text()')[0].extract()
        print(txt)

        # Extraindo os metadados e apresentando o link do primeiro elemento
        metadata = artigos.xpath("//div/div[@class='entry-meta']/div[@class='meta-item meta-comments']/a")
        print(metadata.xpath('@href')[0].extract())

        # Extraindo a primeira tag de comentário
        metadata.xpath("//span[@class='dsq-postid']").get()

        # Recebendo e apresentando o primeiro texto da tag de comentário
        txt = metadata.xpath("//span[@class='dsq-postid']/text()")[0].extract()
        print(txt)

        # Recebendo e apresentando o sexto texto da tag de comentário
        txt = metadata.xpath("//span[@class='dsq-postid']/text()")[5].extract()
        print(txt)

        # Saindo da interface scrapy shell
        quit()