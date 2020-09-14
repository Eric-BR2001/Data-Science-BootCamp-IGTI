# Acessando o diretório padrão do Hadoop
cd /usr/local/hadoop/

# Acessando a pasta dos arquivos importantes para o funcionamento do HDFS
cd tmp

# Removendo o(s) diretório(s) da pasta tmp  
sudo rm -r nm-local-dir/
sudo rm -r dfs/
# Ou também
sudo rm -r /usr/local/hadoop/tmp/* 
...

# Voltando um nível
cd ..

# Formatando o HDFS
bin/hdfs namenode -format

# Verificando os programas java em execução
jps

# Executando um programa de inicialização dos serviços do Hadoop
sbin/start-all.sh

# Verificando novamente os programas java em execução
jps

# Consultando o conteúdo da raiz do HDFS
bin/hdfs dfs -ls /

# Criando um novo diretório na raiz do HDFS com o nome igti
bin/hdfs dfs -mkdir /igti

# Consultando novamente o conteúdo da raiz do HDFS
bin/hdfs dfs -ls /

# Consultando o conteúdo do diretório igti
bin/hdfs dfs -ls /igti

# Criando um novo diretório dentro de igti com o nome ecossistema
bin/hdfs dfs -mkdir /igti/ecossistema

# Consultando novamente o conteúdo do diretório igti
bin/hdfs dfs -ls /igti

# Enviando o arquivo Dados/covidData.txt para o HDFS
bin/hdfs dfs -put /usr/local/hadoop/Dados/covidData.txt /igti/ecossistema

# Consultando o arquivo enviado para o HDFS
bin/hdfs dfs -ls /igti/ecossistema

# Visualizando o conteúdo do arquivo através do comando cat
bin/hdfs dfs -cat /igti/ecossistema/covidData.txt

# Após baixar o arquivo do HDFS, visualizando o conteúdo através do comando vim
vim /home/igti/Downloads/covidData.txt
# pra sair: ESC + :q + ENTER

# Removendo o arquivo covidData.txt do HDFS
bin/hdfs dfs -rmr /igti/ecossistema/covidData.txt

# Removendo o diretório ecossistema do HDFS
bin/hdfs dfs -rmr /igti/ecossistema

# Removendo o diretório igti do HDFS
bin/hdfs dfs -rmr /igti/ecossistema

# Consultando recursivamente o conteúdo do diretório igti no HDFS
bin/hdfs dfs -ls -R /

# Finalizando todos os serviços Hadoop inicializados anteriormente
sbin/stop-all.sh
