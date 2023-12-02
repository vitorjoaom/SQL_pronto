--crio a base de dados
CREATE DATABASE aula1
	
--seleciono a base de dados
USE aula1

--crio as tabelas que vão compor a base de dados
CREATE TABLE pessoa(
	id INT NOT NULL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	dataDeNascimento DATE NOT NULL,
	cpf CHAR(11) NOT NULL,
	rg VARCHAR(15)
)
CREATE TABLE curso (
	id INT NOT NULL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	professor VARCHAR(50) NOT NULL,
	sala CHAR(1) NOT NULL,
	turno CHAR(1) NOT NULL
)
CREATE TABLE endereco (
	rua VARCHAR(50) NOT NULL,
	bairro VARCHAR(30) NOT NULL,
	cidade VARCHAR(15) NOT NULL,
	numero VARCHAR(6) NOT NULL,
	cep CHAR(8) NOT NULL,
	id_pessoa INT NOT NULL FOREIGN KEY(id_pessoa) REFERENCES pessoa(id)
)
CREATE TABLE telefone (
	id_pessoa INT NOT NULL FOREIGN KEY(id_pessoa) REFERENCES pessoa(id),
	numero CHAR(11) NOT NULL
)
CREATE TABLE estuda (
	id_pessoa INT NOT NULL FOREIGN KEY(id_pessoa) REFERENCES pessoa(id),
	id_curso INT NOT NULL FOREIGN KEY(id_curso) REFERENCES curso(id),
)

--apago a base de dados
USE master
DROP DATABASE aula1

USE mercadov2;
IF NOT EXISTS(SELECT name FROM sys.database WHERE name = 'mercadov2')
	BEGIN
		CREATE DATABASE mercadov2;
	END
ELSE
	BEGIN
		PRINT 'A base de dados já existe';
	END

--PRIMEIRO SELECT
IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'curso')
	BEGIN
		CREATE TABLE Cliente(
			idCliente INT IDENTITY(1,1) PRIMARY KEY,
			nome VARCHAR(50)
		);
	END
ELSE
	BEGIN
		PRINT 'A tabela já existe'
	END

--SEGUNDO SELECT
IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'item')
	BEGIN
		CREATE TABLE item(
			idItem INT PRIMARY KEY NOT NULL,
			nomeProduto VARCHAR(30),
			preco DECIMAL(5,2) NOT NULL
		);
	END
ELSE
	BEGIN
		PRINT 'A tabela já existe'
	END

--TERCEIRO SELECT
IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'itensPedido')
	BEGIN
		CREATE TABLE itensPedido(
			quantidade INT NOT NULL,
			idPedido INT NOT NULL,
			idItem INT NOT NULL
		);
	END
ELSE
	BEGIN
		PRINT 'A tabela já existe'
	END

--QUARTO SELECT
IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'pedido')
	BEGIN
		CREATE TABLE pedido(
			idPedido INT PRIMARY KEY NOT NULL,
			numeroDoPedido INT NOT NULL,
			idCliente INT NOT NULL
		);
	END
ELSE
	BEGIN
		PRINT 'A tabela já existe'
	END

	CREATE TABLE funcionario(
		cod_func INT PRIMARY KEY NOT NULL,
		nasc_func INT NOT NULL,
		nome_fun VARCHAR(50) NOT NULL,
		idade_func DATETIME,
		Bonus_func FLOAT,
		Sal_func FLOAT
		); 

INSERT INTO funcionario (cod_func,nasc_func,nome_fun, idade_fun, bonus_func, sal_func)
	VALUES(1,,1,'Helena Aparecida', 62, 0.0, 5000)
INSERT INTO funcionario(cod_func,nasc_func,nome_fun, idade_fun, bonus_func, sal_func)
	VALUES(1,1,'Daniel Aparecido', 62,0.0, 7.000)  2,2,3,3,4)
INSERT INTO funcionario(cod_func, nasc_func,nome_fun, idade_fun, bonus_func, sal_func) 
	VALUES(3,2,'João Carlos', 62, 7.000),'Roberta Silva', 'Giovanna', 'Fernanda Torres', 'Joao Batista')
INSERT INTO funcionario (cod_func, nasc_func, nome_fun, idade_fun, bonus_func, sal_func)
	VALUES(5,3,'Roberta Silva',18,500),   62,62,38,34,18,35,33)
INSERT INTO funcionario (cod_func, nasc_func, nome_fun, idade_fun, bonus_func, sal_func)
	VALUES(6,3,35,'Giovanna',35,0.0,2.500)
INSERT INTO funcionario(cod_func, nasc_func, nome_fun, idade_fun, bonus_func,sal_func)
	VALUES(7,4,'Fernanda Torres', 33,1.800)