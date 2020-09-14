# 1. Iniciar os 5 serviços do Hadoop
/usr/local/hadoop/sbin/start-all.sh

# 2. Criar o diretório Desafio
/usr/local/hadoop/bin/hdfs dfs -mkdir /Desafio

# 3. Inserir o arquivo covidData.txt dentro do diretório Desafio
/usr/local/hadoop/bin/hdfs dfs -put /usr/local/hadoop/Dados/covidData.txt /Desafio

# 4. Iniciar o Hive
/usr/local/hive/bin/hive

# 5. Criar o database dbDesafio
CREATE DATABASE dbDesafio;
USE dbDesafio;

# 6. Criar a tabela DadosCovid (i. Campos separados por vírgula e registros por '\n'. ii. Armazenamento em /Desafio)
CREATE TABLE DadosCovid
(
dataOcorrencia STRING,
siglaPais STRING,
descPais STRING,
regiao STRING,
novosCasos INT,
casosAcumulados INT,
novosObitos INT,
obitosAcumulados INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/Desafio';

# 7. Importar os dados do arquivo covidData.txt para a tabela DadosCovid
LOAD DATA INPATH 'hdfs://localhost:54310/Desafio/covidData.txt' INTO TABLE DadosCovid;

# 8. Consultar a quantidade de registros existentes na tabela DadosCovid
SELECT COUNT(*)
FROM DadosCovid;
# Resultado: 17705 (nome do job: SELECT COUNT(*) FROM DadosCovid (Stage-1))

# 9. Consultar a quantidade de registros existentes para os países Uruguay e Brazil
SELECT descPais, COUNT(*)
FROM DadosCovid
WHERE descPais IN ('Uruguay', 'Brazil')
GROUP BY descPais;
# Resultado: Brazil 92, Uruguay 74

# 10. Consultar a média de novos casos na França 
SELECT AVG(novosCasos)
FROM DadosCovid
WHERE descPais = 'France';
# Resultado: 1141.632

# 11. Consultar a quantidade de novos casos e novos óbitos informados no dia 26/05/2020
SELECT SUM(novosCasos), SUM(novosObitos)
FROM DadosCovid
WHERE dataOcorrencia = '2020-05-26T00:00:00Z';
# Resultado: novosCasos: 99023, novosObitos: 1493

# 12. Consultar a descrição da tabela DadosCovid
DESCRIBE EXTENDED DadosCovid;
' Resultado:
dataocorrencia      	string              	                    
siglapais           	string              	                    
descpais            	string              	                    
regiao              	string              	                    
novoscasos          	int                 	                    
casosacumulados     	int                 	                    
novosobitos         	int                 	                    
obitosacumulados    	int                 	                    
	 	 
Detailed Table Information	Table(tableName:dadoscovid, dbName:dbdesafio, owner:igti, createTime:1597554931, lastAccessTime:0, retention:0, sd:StorageDescriptor(cols:[FieldSchema(name:dataocorrencia, type:string, comment:null), FieldSchema(name:siglapais, type:string, comment:null), FieldSchema(name:descpais, type:string, comment:null), FieldSchema(name:regiao, type:string, comment:null), FieldSchema(name:novoscasos, type:int, comment:null), FieldSchema(name:casosacumulados, type:int, comment:null), FieldSchema(name:novosobitos, type:int, comment:null), FieldSchema(name:obitosacumulados, type:int, comment:null)], location:hdfs://localhost:54310/Desafio, inputFormat:org.apache.hadoop.mapred.TextInputFormat, outputFormat:org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat, compressed:false, numBuckets:-1, serdeInfo:SerDeInfo(name:null, serializationLib:org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe, parameters:{serialization.format=,, line.delim=\n, field.delim=,}), bucketCols:[], sortCols:[], parameters:{}, skewedInfo:SkewedInfo(skewedColNames:[], skewedColValues:[], skewedColValueLocationMaps:{}), storedAsSubDirectories:false), partitionKeys:[], parameters:{transient_lastDdlTime=1597555110, bucketing_version=2, totalSize=929317, numFiles=1}, viewOriginalText:null, viewExpandedText:null, tableType:MANAGED_TABLE, rewriteEnabled:false, catName:hive, ownerType:USER)
'

# 13. Consultar a data de ocorrência, sigla de país e nome do país com 501 novos casos comunicados em um dia
SELECT CONCAT(dataOcorrencia, ' ', siglaPais, ' ', descPais)
FROM DadosCovid
WHERE novosCasos = 501;
# Resultado: 2020-03-11T00:00:00Z ES Spain

# 14. Consultar a quantidade de registros por regiões 
SELECT regiao, COUNT(1)
FROM DadosCovid
GROUP BY regiao
ORDER BY regiao;
' Resultado:
	118
AFRO	3417
AMRO	4079
EMRO	1816
EURO	5431
SEARO	970
WPRO	1874
Job 1: SELECT regiao, COUNT(1) FROM DadosCovid GROUP BY regiao ORDER BY regiao (Stage-1)
Job 2: SELECT regiao, COUNT(1) FROM DadosCovid GROUP BY regiao ORDER BY regiao (Stage-2)
'
