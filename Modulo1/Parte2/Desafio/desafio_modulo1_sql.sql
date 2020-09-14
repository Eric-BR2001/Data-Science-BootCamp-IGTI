/*
Composição de cláusulas no comando Select:
SELECT: selecionar os campos (* significa todos);
FROM: de tabela origem;
(INNER/RIGHT/LEFT/FULL OUTER) JOIN: com a inclusão de tabela(s) de relacionamento por intersecção (INNER), união (FULL OUTER), tabela de origem inteira (LEFT) ou tabela de relacionamento inteira (RIGHT). Além disso, há a necessidade de informar o campo que liga as tabelas (cláusula ON);
WHERE: filtrar por condições com 'E' lógico (AND) ou 'OU' lógico (OR);
GROUP BY: agrupar por campos;
ORDER BY: ordenar pelos campos de forma ascendente (ASC) ou descendente (DESC);
LIMIT: limitar pelos primeiros n registros.

Funções de agregação ou resumo (utilizadas geralmente em SELECT combinadas geralmente com a cláusula GROUP BY):
COUNT: quantidade de registros agrupados (é possível utilizar qualquer campo ou, até mesmo, um número 1 para identificar um registro da tabela e somar as quantidades);
SUM: somatório de campo em registros agrupados;
AVG: média de campo em registros agrupados;
MAX: valor máximo de campo em registros agrupados;
MIN: valor mínimo de campo em registros agrupados.

OBS(1): Tanto as tabelas quanto os campos apresentados podem ter aliases ou apelidos em português (cláusula AS).
OBS(2): Costuma-se incluir o ; para separar os comandos Select e permitir a execução de cada comando separadamente.
*/

-- Pergunta 8
SELECT
    --ROUND(SUM(EM.salario) / COUNT(1), 2) AS "Média Salarial"
    ROUND(AVG(EM.salario), 2) AS "Média Salarial"
FROM
    empregado AS EM
ORDER BY
    SUM(EM.salario) DESC
;
-- 35125.00

-- Pergunta 9
SELECT
    COUNT(1) AS "Quantidade Empregados"
FROM
    empregado AS EM
INNER JOIN
    trabalha_em AS EMPR ON
        EMPR.essn = EM.ssn
INNER JOIN
    projeto AS PR ON
        PR.pnumero = EMPR.pno
WHERE
    EM.dno = 5
    AND EMPR.horas > 10
    AND PR.pjnome = 'ProductX'
;
-- 2

-- Pergunta 10
SELECT
    COUNT(1) AS "Quantidade Empregados"
FROM
    empregado AS EM
INNER JOIN
    dependente AS DD ON
        DD.essn = EM.ssn
WHERE
    EM.pnome LIKE DD.nome_dependente
;
-- 0

-- Pergunta 11
-- SSN do Franklin: 333445555
SELECT
    EM.pnome AS "Nome Empregado"
FROM
    empregado AS EM
WHERE
    EM.superssn = '333445555'
;

-- Outra forma
SELECT
    EM.pnome AS "Nome Empregado"
FROM
    empregado AS EM
INNER JOIN
    empregado AS SUP ON
        SUP.ssn = EM.superssn
WHERE
    SUP.pnome = 'Franklin'
;
-- Joyce e Ramesh

-- Pergunta 12
SELECT
    EM.pnome AS "Nome Empregado"
FROM
    empregado AS EM
INNER JOIN
    trabalha_em AS EMPR ON
        EMPR.essn = EM.ssn
INNER JOIN
    projeto AS PR ON
        PR.pnumero = EMPR.pno
WHERE
    PR.pjnome LIKE 'Newbenefits'
ORDER BY
    EMPR.horas DESC
LIMIT
    1
;
-- Alicia

-- Pergunta 13
SELECT
    ROUND(SUM(EM.salario), 2) AS "Soma Salarial"
FROM
    empregado AS EM
INNER JOIN
    departamento AS DP ON
        DP.dnumero = EM.dno
WHERE
    DP.dnome LIKE 'Research'
;
-- 133000,00

-- Pergunta 14
-- Salários Anteriores e Posteriores dos Funcionário
SELECT
    EM.pnome AS "Nome",
    EM.salario AS "Salário Atual",
    (EM.salario * 0.1) AS "10% do Salário",
    EM.salario * 1.1 AS "Salário Final"
FROM
    empregado AS EM
INNER JOIN
    trabalha_em AS EMPR ON
        EMPR.essn = EM.ssn
INNER JOIN
    projeto AS PR ON
        PR.pnumero = EMPR.pno
WHERE
    PR.pjnome LIKE 'ProductX'
;

SELECT
    SUM(EM.salario * 1.1) AS "Salário Final"
FROM
    empregado AS EM
INNER JOIN
    trabalha_em AS EMPR ON
        EMPR.essn = EM.ssn
INNER JOIN
    projeto AS PR ON
        PR.pnumero = EMPR.pno
WHERE
    PR.pjnome LIKE 'ProductX'
;
-- 60500,00

-- Pergunta 15
SELECT
    DP.dnome AS "Departamento",
    AVG(EM.salario) AS "Média Salarial"
FROM
    departamento AS DP
INNER JOIN
    empregado AS EM ON
        EM.dno = DP.dnumero
GROUP BY
    DP.dnome
ORDER BY
    AVG(EM.salario)
LIMIT
    1
;
-- Administration