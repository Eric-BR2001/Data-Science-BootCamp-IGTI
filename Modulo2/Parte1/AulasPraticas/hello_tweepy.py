# Instalação das bibliotecas via cmd:
# conda install -c conda-forge tweepy
# conda install -c conda-forge textblob
# conda install -c conda-forge numpy

import tweepy

twitter_keys = {
    'consumer_key': '',
    'consumer_secret': '',
    'access_token': '',
    'access_token_secret': ''
}

# Definindo o objeto de autenticação à API do Twitter com as chaves de Consumer e Access
auth = tweepy.OAuthHandler(twitter_keys['consumer_key'], twitter_keys['consumer_secret'])
auth.set_access_token(twitter_keys['access_token'], twitter_keys['access_token_secret'])

# Acessando a API com a autenticação criada
api = tweepy.API(auth)

# Acessando os tweets da timeline da própria conta (home)
public_tweets = api.home_timeline()

# Apresentando cada tweet coletado
for tweet in public_tweets:
    print(tweet.text)