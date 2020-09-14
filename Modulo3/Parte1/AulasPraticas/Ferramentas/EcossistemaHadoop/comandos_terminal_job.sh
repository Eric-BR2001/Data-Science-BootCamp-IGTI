# Acessando o diretório do programa exemplo em java
cd /usr/local/hadoop/ExemploIGTI

# Acessando o diretório src
cd src

# Editando o arquivo
sudo vim ExemploIGTI.java
# teclar "a" para permitir a edição
# para salvar e sair, ESC + :wq + ENTER

# Voltando um nível
cd ..

# Compilando o código java
ant -f build_ExemploIGTI.xml makejar
# será criado o arquivo ExemploIGTI.jar


# Apagando os arquivos, formatando o HDFS e iniciando os serviços do Hadoop
#cd ..
#cd tmp/
#sudo rm -r nm-local-dir/
#sudo rm -r dfs/
#cd ..
#bin/hdfs namenode -format
#sbin/start-all.sh
#jps

# Executando o arquivo jar dentro do Hadoop
bin/hadoop jar /usr/local/hadoop/ExemploIGTI/ExemploIGTI.jar IGTI.ExemploIGTI

# Consultando os diretórios e arquivos criados
bin/hdfs dfs -ls -R /

# Consultando o conteúdo do arquivo do diretório de entrada
bin/hdfs dfs -cat /user/igti/PastaEntrada/covidData.txt

# Excluindo os diretorios criados
bin/hdfs dfs -rmr /user
