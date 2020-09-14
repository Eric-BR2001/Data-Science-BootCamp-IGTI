# Acessando a pasta do Hadoop
cd /usr/local/hadoop/

# Criando um diretório hive dentro do HDFS
bin/hdfs dfs -mkdir /hive

# Acessando a pasta do Hive
cd /usr/local/hive

# Excluindo a pasta com os bancos de dados antigos do Hive
rm -rf metastore_db/

# Inicializando os schemas do Hive
bin/schematool -initSchema -dbType derby

# Acessando o ambiente shell do Hive
bin/hive

# Comandos no ambiente shell do MySQL

# Apresentando os bancos de dados disponíveis
SHOW DATABASES;

# Criando o banco de dados firstDB
CREATE DATABASE firstDB;

# Criando a tabela CLIENTE_VENDA dentro do banco firstDB
CREATE TABLE CLIENTE_VENDA
(
ID INT,
NOME STRING,
QTDE_ITENS INT,
TOTAL_VENDAS FLOAT,
LIMITE_CREDITO FLOAT,
ESTADO STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/hive/firstDB/cliente_venda';

# Carregando os dados importados para o HDFS na tabela CLIENTE_VENDA com o Hive
LOAD DATA INPATH 'hdfs://localhost:54310/igti/part-m-00000' INTO TABLE CLIENTE_VENDA;

# Consultando todos os registros da tabela
SELECT * FROM CLIENTE_VENDA;

# Consultando os registros ordenados por total de vendas
SELECT * FROM CLIENTE_VENDA ORDER BY TOTAL_VENDAS;

# Consultando o total de vendas por cliente
SELECT ID, SUM(TOTAL_VENDAS) FROM CLIENTE_VENDA GROUP BY ID;

# Consultando os registros que tem ID maior do que 3
SELECT * FROM CLIENTE_VENDA WHERE ID > 3;

# Saindo do ambiente shell do Hive
quit;
