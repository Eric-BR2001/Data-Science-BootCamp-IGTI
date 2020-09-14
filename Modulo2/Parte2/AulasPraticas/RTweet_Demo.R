# Definindo o workspace padrão
setwd("C:/Users/USUARIO/Downloads/IGTI/Bootcamp Online - Cientista de Dados/3_Modulo2_Coleta_e_Obtencao_de_Dados/Parte2/AulasPraticas")
getwd()

# Instalação de pacotes
# install.packages("twitterR") #pacote descontinuado
install.packages("rtweet", dependencies = TRUE, INSTALL_opts = '--no-lock') #pacote mais atual
install.packages("maps")

# Utilização dos pacotes
# Documentação do rtweet: https://cran.r-project.org/web/packages/rtweet/rtweet.pdf
library(rtweet) #usa a API do Twitter
library(maps)

# Autenticação
token <- create_token(app="coletor-igti-nelson",
                      consumer_key="",
                      consumer_secret="",
                      access_token="",
                      access_secret="")

# Parâmetros de busca
search.string <- c("#ficaemcasa OR #coronavirus OR #covid OR #covid-19 OR #covid19")
type <- "mixed"
no.of.tweets <- 1000 #número de tweets solicitados 1000

# Buscando por hashtags
# include_rts (TRUE ou FALSE) - usado para indicar se inclui retweets ou não na pesquisa
# retryonratelimit (TRUE ou FALSE) - usado para indicar se continua ou não depois do limite de 18000 tweets por 15 minutos
tweets <- search_tweets(search.string, n=no.of.tweets, lang="pt", type=type, include_rts=FALSE, retryonratelimit=TRUE)

# Salvando o vetor de tweets como CSV e apenas o texto em TXT na codificação do português
write_as_csv(tweets, "dados/TweetsRawData.csv", fileEncoding="latin1//TRANSLIT")
write.table(tweets$text, "dados/TweetsRawData.txt", fileEncoding="latin1//TRANSLIT")

# Criando as latitudes e longitudes para cada tweet
tweets <- lat_lng(tweets) #cria lat/lng variáveis usando todos os tweets disponíveis

# Plotando o mapa do Brasil
par(mar=c(0, 0, 0, 0)) #função par define ou ajusta os parâmetros de plotagem e o parâmetro mar ajusta as margens
map("world", "brazil", lwd=0.3, fill=T, col="grey95")
map(,, add=T)
map.axes()
map.scale(ratio=T, cex=0.3)
abline(h=0, lty=2)
map.cities(country="Brazil", minpop=2000000, pch=15, cex=0.9) #pacote maps

# Adicionando os tweets ao mapa
with(tweets, points(lng, lat, pch=20, cex=.75, col=rgb(0, .3, .7, .75)))