# install.packages('jsonlite')
library(jsonlite)

# Leitura de arquivo JSON sem simplificação
jsondata1 <- read_json(file.choose(), simplifyVector = FALSE)
print(jsondata1)

# Leitura de arquivo JSON com simplificação
jsondata2 <- read_json(file.choose(), simplifyVector = TRUE)
print(jsondata2)

# União de arquivos JSON
json_list <- list(jsondata1, jsondata2)
json_list

# Gravação do conteúdo em arquivo JSON
write_json(json_list, 'C:/Users/USUARIO/Downloads/IGTI/Bootcamp Online - Cientista de Dados/3_Modulo2_Coleta_e_Obtencao_de_Dados/Parte1/AulasPraticas/dados/studentsSmall3.json')

# Leitura do arquivo JSON gravado
jsondata3 <- read_json('C:/Users/USUARIO/Downloads/IGTI/Bootcamp Online - Cientista de Dados/3_Modulo2_Coleta_e_Obtencao_de_Dados/Parte1/AulasPraticas/dados/studentsSmall3.json', simplifyVector = TRUE)
print(jsondata3)