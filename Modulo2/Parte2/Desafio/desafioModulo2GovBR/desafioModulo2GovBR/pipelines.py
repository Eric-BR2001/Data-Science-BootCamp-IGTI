# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html


# useful for handling different item types with a single interface
from itemadapter import ItemAdapter

import json, codecs

class Desafiomodulo2GovbrPipeline:
    def open_spider(self, spider):      
        #Abre arquivo para armazenar os itens raspados
        if spider.name == 'ScrapyGovBR':
            self.file = codecs.open('noticias1.json', 'w', encoding='utf8')

        elif spider.name == 'CrawlerGovBR':
            self.file = codecs.open('noticias2.json', 'w', encoding='utf8')

        print('Open json file.')
        
        self.file.write("[")    
        
    def close_spider(self, spider):
        #Abre arquivo
        self.file.write("]")        
        self.file.close()
        print('Close json file.')

    def write_file(self, item, spider):
        # Os itens raspados serão gravados no arquivo 'scraped_items.json'.
        line = json.dumps(
            dict(item),
            indent=4,
            sort_keys=True,
            separators=(',', ': '),
            ensure_ascii=False
        ) + ",\n"
        self.file.write(line)
    
    def write_TXT(self, item, spider):   
        print('ARQUIVO TXT.')
        self.txtfile = open('noticias2.txt', 'a', encoding='utf8')
        #print('Texto: %s '% item['texto_noticia'])
        
        self.txtfile.write(''.join(item['texto_noticia']))
        self.txtfile.write("\n")
        self.txtfile.close()
        
    def process_item(self, item, spider):
        Desafiomodulo2GovbrPipeline.write_file(self, item, spider)
        
        if spider.name == 'CrawlerGovBR':
            Desafiomodulo2GovbrPipeline.write_TXT(self, item, spider)
        
        return item