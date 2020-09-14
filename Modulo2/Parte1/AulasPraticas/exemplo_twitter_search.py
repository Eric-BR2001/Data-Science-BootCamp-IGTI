# Fonte: https://minerandodados.com.br/twitter-com-python/
from TwitterSearch import TwitterSearch, TwitterSearchOrder, TwitterSearchException

try:
    # Declarando as variáveis para a autenticação como um construtor da classe TwitterSearch
    ts = TwitterSearch(
        consumer_key = '',
        consumer_secret = '',
        access_token = '',
        access_token_secret = ''
    )

    # Intanciando um objeto da classe TwitterSearchOrder para definir as configurações de pesquisa
    tso = TwitterSearchOrder()

    # Definindo os termos a serem pesquisados: iphone
    tso.set_keywords(['iphone'])
    
    # Definindo a linguagem para consulta: português
    tso.set_language('pt')

    # Consultando e apresentando o nome do usuário e tweet realizado
    for tweet in ts.search_tweets_iterable(tso):
        print('@%s tweeted: %s' % (tweet['user']['screen_name'], tweet['text']))

# Em caso de erro da biblioteca, apresentar a mensagem
except TwitterSearchException as e:
    print(e)