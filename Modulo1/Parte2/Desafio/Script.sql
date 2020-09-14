-- DDL --
-- Criando um banco de dados (opcional)
CREATE DATABASE EMPRESA;

-- Criando a tabela de empregados
CREATE TABLE EMPREGADO
(
	-- campos
	PNOME VARCHAR(15) NOT NULL,
	MINICIAL CHAR,
	UNOME VARCHAR(15) NOT NULL,
	SSN CHAR(9) NOT NULL, -- código do empregado
	DATANASC DATE,
	ENDERECO VARCHAR(30),
	SEXO CHAR,
	SALARIO DECIMAL(10,2),
	SUPERSSN CHAR(9), -- código do superior/gerente

	-- regras
	PRIMARY KEY(SSN),
	FOREIGN KEY(SUPERSSN) REFERENCES EMPREGADO(SSN)
);

-- Criando a tabela de departamentos
CREATE TABLE DEPARTAMENTO
(
	-- campos
	DNOME VARCHAR(15) NOT NULL,
	DNUMERO INT NOT NULL,
	GERSSN CHAR(9) NULL, -- código do superior/gerente
	GERDATAINICIO DATE,
	
	-- regras
	PRIMARY KEY (DNUMERO),
	UNIQUE (DNOME),
	FOREIGN KEY (GERSSN) REFERENCES EMPREGADO(SSN)
);

-- Criando o campo número de departartamento na tabela empregados (1xn)
ALTER TABLE EMPREGADO
	ADD DNO INTEGER,
	ADD FOREIGN KEY(DNO) REFERENCES DEPARTAMENTO(DNUMERO)
;

-- Criando a tabela de relacionamento departamentos x localizações (1x1)
CREATE TABLE DEPTO_LOCALIZACOES
(
	-- campos
	DNUMERO INT NOT NULL,
	DLOCALIZACAO VARCHAR(15) NOT NULL,
	
	-- regras
	PRIMARY KEY (DNUMERO, DLOCALIZACAO),
	FOREIGN KEY (DNUMERO) REFERENCES DEPARTAMENTO(DNUMERO)
);

-- Criando a tabela de projetos
CREATE TABLE PROJETO
(
	-- campos
	PJNOME VARCHAR(15) NOT NULL,
	PNUMERO INT NOT NULL,
	PLOCALIZACAO VARCHAR(15),
	DNUM INT NOT NULL,

	-- regras
	PRIMARY KEY (PNUMERO),
	UNIQUE (PJNOME),
	FOREIGN KEY (DNUM) REFERENCES DEPARTAMENTO(DNUMERO)
);

-- Criando a tabela de relacionamento empregados x projetos (nxn)
CREATE TABLE TRABALHA_EM (
	-- campos
	ESSN CHAR(9) NOT NULL,
	PNO INT NOT NULL,
	HORAS DECIMAL(3,1) NOT NULL,

	-- regras
	PRIMARY KEY (ESSN, PNO),
	FOREIGN KEY (ESSN) REFERENCES EMPREGADO(SSN),
	FOREIGN KEY (PNO) REFERENCES PROJETO(PNUMERO)
);

-- Criando a tabela de dependentes
CREATE TABLE DEPENDENTE
(
	-- campos
	ESSN CHAR(9) NOT NULL,
	NOME_DEPENDENTE VARCHAR(15) NOT NULL,
	SEX CHAR,
	DATANASC DATE,
	PARENTESCO VARCHAR(8),

	-- regras
	PRIMARY KEY (ESSN, NOME_DEPENDENTE),
	FOREIGN KEY (ESSN) REFERENCES EMPREGADO(SSN)
);

-- DML --
-- Inserindo registros na tabela de departamentos
INSERT INTO DEPARTAMENTO VALUES
('Headquarters', 1, NULL, '1971-06-19'),
('Administration', 4, NULL, '1985-01-01'),
('Research', 5, NULL, '1978-05-22'),
('Automation', 7, NULL, '2006-10-05');

-- Inserindo registros na tabela de empregados
INSERT INTO EMPREGADO VALUES
('James', 'E', 'Borg', '888665555', '1927-11-10', 'Stone, Houston, TX', 'M', 55000, NULL, 1),
('Jennifer', 'S', 'Wallace', '987654321', '1931-06-20', 'Berry, Bellaire, TX', 'F', 43000, '888665555', 4),
('John', 'B', 'Smith', '123456789', '1955-01-09', '731 Fondren, Houston, TX', 'M', 30000, '987654321', 5),
('Franklin', 'T', 'Wong', '333445555', '1945-12-08', '638 Voss, Houston, TX', 'M', 40000, '888665555', 5),
('Joyce', 'A', 'English', '453453453', '1962-12-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5),
('Ramesh', 'K', 'Narayan', '666884444', '1952-09-15', 'Fire Oak, Humble, TX', 'M', 38000, '333445555', 5),
('Ahmad', 'V', 'Jabbar', '987987987', '1959-03-29', 'Dallas, Houston, TX', 'M', 25000, '987654321', 4),
('Alicia', 'J', 'Zelaya', '999887777', '1958-06-19', 'Castle, SPring, TX', 'F', 25000, '987654321', 4);

-- Alterando ou atribuindo um código de gerente/superior para a tabela de departamentos
UPDATE DEPARTAMENTO SET GERSSN = '888665555' WHERE DNUMERO = 1;
UPDATE DEPARTAMENTO SET GERSSN = '987654321' WHERE DNUMERO = 4;
UPDATE DEPARTAMENTO SET GERSSN = '333445555' WHERE DNUMERO = 5;
UPDATE DEPARTAMENTO SET GERSSN = '123456789' WHERE DNUMERO = 7;

-- Inserindo registros na tabela de dependentes
INSERT INTO DEPENDENTE VALUES
('123456789', 'Alice', 'F', CAST('31-Dec-78' as DATE), 'Daughter'),
('123456789', 'Elizabeth', 'F', CAST('05-May-57' as DATE), 'Spouse'),
('123456789', 'Michael', 'M', CAST('01-Jan-78' as DATE), 'Son'),
('333445555', 'Alice', 'F', CAST('05-Apr-76' as DATE), 'Daughter'),
('333445555', 'Joy', 'F', CAST('03-May-48' as DATE), 'Spouse'),
('333445555', 'Theodore', 'M', CAST('25-Oct-73' as DATE), 'Son'),
('987654321', 'Abner', 'M', CAST('29-Feb-32' as DATE), 'Spouse');

-- Inserindo registros na tabela de relacionamento departamentos x localizações
INSERT INTO DEPTO_LOCALIZACOES VALUES
(1, 'Houston'),
(4, 'Stafford'),
(5, 'Bellaire'),
(5, 'Sugarland'),
(5, 'Houston');

-- Inserindo registros na tabela de projetos
INSERT INTO PROJETO VALUES
('ProductX', 1, 'Bellaire', 5),
('ProductY', 2, 'Sugarland', 5),
('ProductZ', 3, 'Houston', 5),
('Computerization', 10, 'Stafford', 4),
('Reorganization', 20, 'Houston', 1),
('Newbenefits', 30, 'Stafford', 4);

-- Inserindo registros na tabela de relacionamento empregados x projetos
INSERT INTO TRABALHA_EM VALUES
('123456789', 1, 32.5),
('123456789', 2, 7.5),
('333445555', 2, 10),
('333445555', 3, 10),
('333445555', 10, 10),
('333445555', 20, 10),
('453453453', 1, 20),
('453453453', 2, 20),
('666884444', 3, 40),
('888665555', 20, 0),
('987654321', 20, 15),
('987654321', 30, 20),
('987987987', 10, 35),
('987987987', 30, 5),
('999887777', 10, 10),
('999887777', 30, 30);