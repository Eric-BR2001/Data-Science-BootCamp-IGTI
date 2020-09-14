# Definindo o workspace padrão
setwd("C:/Users/USUARIO/Downloads/IGTI/Bootcamp Online - Cientista de Dados/3_Modulo2_Coleta_e_Obtencao_de_Dados/Parte2/AulasPraticas")
getwd()

# Instalação de pacotes
# install.packages("twitterR") #pacote descontinuado
install.packages("rtweet", dependencies = TRUE, INSTALL_opts = '--no-lock') #pacote mais atual

# Utilização dos pacotes
# Documentação do rtweet: https://cran.r-project.org/web/packages/rtweet/rtweet.pdf
library(rtweet) #usa a API do Twitter

# Autenticação
token <- create_token(app="coletor-igti-nelson",
                      consumer_key="",
                      consumer_secret="",
                      access_token="",
                      access_secret="")

# Parâmetros de busca
screen_name <- "jairbolsonaro"
no.of.tweets <- 1000 #número de tweets solicitados 1000

# Buscando por tweets de um usuário apenas
tweets <- get_timeline(screen_name, n=no.of.tweets, include_rts=TRUE, exclude_replies=TRUE)

# Salvando o vetor de tweets como CSV na codificação do português
write_as_csv(tweets, "dados/TweetsByNameRawData.csv", fileEncoding="latin1//TRANSLIT")

# Plotando a série temporal dos tweets
ts_plot(tweets, "3 hours") +
  ggplot2::theme_minimal() +
  ggplot2::theme(plot.title=ggplot2::element_text(face="bold")) +
  ggplot2::labs(
    x=NULL,
    y=NULL,
    title="Frequência de tweets da conta 'jairbolsonaro' nos últimos 9 dias",
    subtitle="Contagem de tweets agregados em intervalo de 3 horas",
    caption="\nFonte: Dados coletados do Twitter com o pacote rtweet"
  )
