--- Script DDL

--- Criando o Banco de Dados
CREATE DATABASE ProjetoMedicals;
GO

USE ProjetoMedicals;
GO

--- Criando Tabelas
CREATE TABLE TipoUsuario
(
		IdTipoUsuario INT PRIMARY KEY IDENTITY,
		NomeTipoUsuario VARCHAR (100) UNIQUE NOT NULL
);
GO

CREATE TABLE Usuario
(
		Idusuario INT PRIMARY KEY IDENTITY,
		IdTipoUsuario INT FOREIGN KEY REFERENCES TipoUsuario(IdTipoUsuario),
		NomeUsuario VARCHAR (150) NOT NULL,
		Email VARCHAR (150) UNIQUE NOT NULL,
		Senha VARCHAR (150) UNIQUE NOT NULL
);
GO

CREATE TABLE Especialidade
(
		IdEspecialidade INT PRIMARY KEY IDENTITY,
		Especialidade VARCHAR (100) UNIQUE NOT NULL
);
GO

CREATE TABLE Clinica
(
		IdClinica INT PRIMARY KEY IDENTITY,
		NomeFantasia VARCHAR (150) UNIQUE NOT NULL,
		Endereco VARCHAR (150) UNIQUE NOT NULL,
		RazaoSocial VARCHAR (150) UNIQUE NOT NULL,
		CNPJ CHAR(14) UNIQUE NOT NULL

);
GO

CREATE TABLE Medico
(
		IdMedico INT PRIMARY KEY IDENTITY,
		IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario),
		IdEspecialidade INT FOREIGN KEY REFERENCES Especialidade(IdEspecialidade),
		IdClinica INT FOREIGN KEY REFERENCES Clinica(IdClinica),
		CRM VARCHAR (100) UNIQUE NOT NULL

);
GO

CREATE TABLE Paciente
(
		IdPaciente INT PRIMARY KEY IDENTITY,
		IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario),
		Nome VARCHAR (50) NOT NULL,
		RG CHAR (10) UNIQUE NOT NULL,
		CPF CHAR (11) UNIQUE NOT NULL,
		Endereco VARCHAR (150) UNIQUE NOT NULL,
		DataNascimento DATE NOT NULL,
		Telefone VARCHAR (11)

);
GO

CREATE TABLE Situacao
(
		IdSituacao INT PRIMARY KEY IDENTITY,
		Situacao VARCHAR (50) NOT NULL

);
GO

CREATE TABLE Consulta
(
		IdConsulta INT PRIMARY KEY IDENTITY,
		IdPaciente INT FOREIGN KEY REFERENCES Paciente(IdPaciente),
		IdMedico INT FOREIGN KEY REFERENCES Medico(IdMedico),
		IdSituacao INT FOREIGN KEY REFERENCES Situacao(IdSituacao),
		DataConsulta DATE NOT NULL,
		Descricao VARCHAR(150) NOT NULL

);
GO


