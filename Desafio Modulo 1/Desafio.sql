/*
Pergunta 8
Considere o banco de dados do enunciado. 
Crie uma consulta em SQL e responda: Qual a média salarial nessa empresa?
*/
SELECT AVG(SALARIO) FROM EMPREGADO;
/*
Pergunta 9
Considere o banco de dados do enunciado. 
Crie uma consulta em SQL e responda: 
Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?
*/
SELECT COUNT(*) FROM empregado, trabalha_em, projeto
WHERE dno=5
AND essn = esnn AND pno= pnumero
AND horas > 10
AND pjnome= 'PRODUCTX'
/*
Pergunta 10
Considere o banco de dados do enunciado. 
Crie uma consulta em SQL e responda: Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?
*/
SELECT COUNT(*) FROM empregado, dependente	
WHERE essn = ssn AND pnome = nome_dependente
/*
Pergunta 11
Considere o banco de dados do enunciado. 
Crie uma consulta em SQL e responda: Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
Considere o banco de dados do enunciado. 
Crie uma consulta em SQL e responda: Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong
*/
SELECT e. pnome
WHERE ger.ssn = e.superssn
AND ger.pnome= 'Franklin' AND ger.unome ='Wong'
/*
Pergunta 12
Considere o banco de dados do enunciado. 
Crie uma consulta em SQL e responda: Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?
*/
Select e.* FROm empregado e JOIN  trabalha_em t ON (e.ssn = t.essn)
WHERE t.horas = (SELECT MAX(t.horas) FROM projeto p JOIN trabalha_em t ON (t.pno = p.pnumero)
WHERE UPPER(TRIM(p.pjnome)) = UPPER(TRIM('Newbenefits')))
/*
Pergunta 13
Considere o banco de dados do enunciado. 
Crie uma consulta em SQL e responda: Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?
*/
SELECT SUM(e.salario) FROM empregado e JOIN departamento d ON (d.dnumero = e.dno)
WHERE UPPER(TRIM(d.dnome)) = UPPER(TRIM('RESEARCH'))
/*
Pergunta 14
Considere o banco de dados do enunciado. 
Crie uma consulta em SQL e responda: Qual seria o custo do projeto com folha salarial (soma de todos os salários)
	 caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
*/
SELECT SUM(e.salario) * 1.1 FROM empregado e
JOIN trabalha_em t ON (t.essn = e.ssn)
JOIN projeto p ON (p.pnumero = t.pno)
WHERE UPPER(TRIM(p.pjnome)) = UPPER(TRIM('ProductX'))
/*
Pergunta 15
Considere o banco de dados do enunciado. 
Crie uma consulta em SQL e responda: Qual o nome do departamento com a menor média de salário entre seus funcionários?
*/
SELECT d.dnome, AVG(e.salario) FROM departamento d JOIN empregado e ON (e.dno = d.dnumero)
GROUP BY d.dnome
ORDER BY 1 ASC
LIMIT 1