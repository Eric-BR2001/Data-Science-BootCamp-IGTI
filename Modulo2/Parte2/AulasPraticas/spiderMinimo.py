# -*- coding: utf-8 -*-
"""
Created on Sun Aug 2 23:22:55 2020

@author: Nelson Dressler
"""

import scrapy

class SpiderMinimo(scrapy.Spider):
    """Scrapy spider mínimo"""
    name = 'minimo'

# Pra executar, deve-se executar o seguinte comando no cmd: scrapy runspider spiderMinimo.py

"""
Resultado da execução:

2020-08-02 23:16:27 [scrapy.utils.log] INFO: Scrapy 2.2.1 started (bot: scrapybot)
2020-08-02 23:16:27 [scrapy.utils.log] INFO: Versions: lxml 4.5.2.0, libxml2 2.9.10, cssselect 1.1.0, parsel 1.6.0, w3lib 1.22.0, Twisted 20.3.0, Python 3.7.1 (default, Oct 28 2018, 08:39:03) [MSC v.1912 64 bit (AMD64)], pyOpenSSL 19.0.0 (OpenSSL 1.0.2g  1 Mar 2016), cryptography 2.5, Platform Windows-10-10.0.19041-SP0
2020-08-02 23:16:27 [scrapy.utils.log] DEBUG: Using reactor: twisted.internet.selectreactor.SelectReactor
2020-08-02 23:16:27 [scrapy.crawler] INFO: Overridden settings:
{'SPIDER_LOADER_WARN_ONLY': True}
2020-08-02 23:16:28 [scrapy.extensions.telnet] INFO: Telnet Password: 4ff625e5aeee76ad
2020-08-02 23:16:28 [scrapy.middleware] INFO: Enabled extensions:
['scrapy.extensions.corestats.CoreStats',
 'scrapy.extensions.telnet.TelnetConsole',
 'scrapy.extensions.logstats.LogStats']
2020-08-02 23:16:28 [scrapy.middleware] INFO: Enabled downloader middlewares:
['scrapy.downloadermiddlewares.httpauth.HttpAuthMiddleware',
 'scrapy.downloadermiddlewares.downloadtimeout.DownloadTimeoutMiddleware',
 'scrapy.downloadermiddlewares.defaultheaders.DefaultHeadersMiddleware',
 'scrapy.downloadermiddlewares.useragent.UserAgentMiddleware',
 'scrapy.downloadermiddlewares.retry.RetryMiddleware',
 'scrapy.downloadermiddlewares.redirect.MetaRefreshMiddleware',
 'scrapy.downloadermiddlewares.httpcompression.HttpCompressionMiddleware',
 'scrapy.downloadermiddlewares.redirect.RedirectMiddleware',
 'scrapy.downloadermiddlewares.cookies.CookiesMiddleware',
 'scrapy.downloadermiddlewares.httpproxy.HttpProxyMiddleware',
 'scrapy.downloadermiddlewares.stats.DownloaderStats']
2020-08-02 23:16:28 [scrapy.middleware] INFO: Enabled spider middlewares:
['scrapy.spidermiddlewares.httperror.HttpErrorMiddleware',
 'scrapy.spidermiddlewares.offsite.OffsiteMiddleware',
 'scrapy.spidermiddlewares.referer.RefererMiddleware',
 'scrapy.spidermiddlewares.urllength.UrlLengthMiddleware',
 'scrapy.spidermiddlewares.depth.DepthMiddleware']
2020-08-02 23:16:28 [scrapy.middleware] INFO: Enabled item pipelines:
[]
2020-08-02 23:16:28 [scrapy.core.engine] INFO: Spider opened
2020-08-02 23:16:28 [scrapy.extensions.logstats] INFO: Crawled 0 pages (at 0 pages/min), scraped 0 items (at 0 items/min)
2020-08-02 23:16:28 [scrapy.extensions.telnet] INFO: Telnet console listening on 127.0.0.1:6023
2020-08-02 23:16:28 [scrapy.core.engine] INFO: Closing spider (finished)
2020-08-02 23:16:28 [scrapy.statscollectors] INFO: Dumping Scrapy stats:
{'elapsed_time_seconds': 0.065493,
 'finish_reason': 'finished',
 'finish_time': datetime.datetime(2020, 8, 3, 2, 16, 28, 608493),
 'log_count/INFO': 10,
 'start_time': datetime.datetime(2020, 8, 3, 2, 16, 28, 543000)}
2020-08-02 23:16:28 [scrapy.core.engine] INFO: Spider closed (finished)
"""