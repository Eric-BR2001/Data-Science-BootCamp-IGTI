# install.packages('readr')
library(readr)

# Leitura de arquivo CSV
file1 <- paste('C:/Users/USUARIO/Downloads/IGTI/Bootcamp Online - Cientista de Dados/3_Modulo2_Coleta_e_Obtencao_de_Dados/Parte1/AulasPraticas/dados', '/contabilidade.csv', sep = "")
data0 <- read_csv(file1)
data1 <- read.csv2(file1)
print(data0)
print(data1)

# Leitura de arquivo CSV
file2 <- paste('C:/Users/USUARIO/Downloads/IGTI/Bootcamp Online - Cientista de Dados/3_Modulo2_Coleta_e_Obtencao_de_Dados/Parte1/AulasPraticas/dados', '/iris.csv', sep = "")
data2 <- read.table(file2, header = T, sep = ",")
head(data2)
summary(data2)

# Leitura de arquivo TXT não tabelado
file3 <- paste('C:/Users/USUARIO/Downloads/IGTI/Bootcamp Online - Cientista de Dados/3_Modulo2_Coleta_e_Obtencao_de_Dados/Parte1/AulasPraticas/dados', '/arquivoTXT.txt', sep = "")
data3 <- read.delim(file3)
print(data3)

# Escolhendo o arquivo no momento da leitura
data4 <- read.delim(file.choose(), encoding = 'utf-8')
print(data4)

# Leitura de arquivo disponível na internet
URL <- 'http://diretorios.ifb.edu.br/diretorios/908/arquivos/download/certificados.txt'
data5 <- read.delim(URL)
print(data5)
head(data5)

# Criação um arquivo de texto
outfile <- 'C:/Users/USUARIO/Downloads/IGTI/Bootcamp Online - Cientista de Dados/3_Modulo2_Coleta_e_Obtencao_de_Dados/Parte1/AulasPraticas/dados/ifbdata.txt'
print(outfile)
write.table(data5, outfile, append = FALSE, sep = ",", row.names = FALSE, col.names = TRUE)

# Leitura do arquivo criado
data6 <- read.delim(outfile)
head(data6)

# Conferir se um determinado arquivo de dados existe no seu diretório
nameFile <- 'arquivoTXT.txt'
file.exists(nameFile)

nameFile <- 'C:/Users/USUARIO/Downloads/IGTI/Bootcamp Online - Cientista de Dados/3_Modulo2_Coleta_e_Obtencao_de_Dados/Parte1/AulasPraticas/dados/arquivoTXT.txt'
file.exists(nameFile)