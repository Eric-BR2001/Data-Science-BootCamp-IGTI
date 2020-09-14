# Acessando o ambiente shell do MySQL
mysql -u root -p
# password: igti

# Comandos no ambiente shell do MySQL

# Apresentando os bancos de dados disponíveis
SHOW DATABASES;
' RESULTADO:
information_schema
IGTI
mysql
performance_schema
sys   
'
# Selecionando o banco de dados IGTI para uso
USE IGTI;

# Apresentando as tabelas disponíveis no banco de dados IGTI
SHOW TABLES;
' RESULTADO:
CLIENTE_VENDA
CLIENTE_VENDA_AGRUP
'

# Consultando o conteúdo da tabela CLIENTE_VENDA
SELECT
	*
FROM
	CLIENTE_VENDA
;

# Consultando o conteúdo da tabela CLIENTE_VENDA_AGRUP
SELECT
	*
FROM 
	CLIENTE_VENDA_AGRUP
;

# Saindo do ambiente shell do MySQL
quit;

# Acessando a pasta do Sqoop
cd /usr/local/sqoop/

# Importando o conteúdo da tabela CLIENTE_VENDA do MySQL para o HDFS através do Sqoop (job CLIENTE_VENDA.jar)
bin/sqoop import --connect jdbc:mysql://localhost/IGTI?zeroDateTimeBehavior=convert_To_Null --username root --password igti --table CLIENTE_VENDA -m 1 --bindir /usr/local/sqoop/lib --target-dir /igti

# Acessando a pasta do Hadoop
cd /usr/local/hadoop/

# Verificando as pastas no HDFS
bin/hdfs dfs -ls /

# Verificando o conteúdo da pasta igti
bin/hdfs dfs -ls /igti

# Visualizando o conteúdo do arquivo criado pelo sqoop 
bin/hdfs dfs -cat /igti/part-m-00000
