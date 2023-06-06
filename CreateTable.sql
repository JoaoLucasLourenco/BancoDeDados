#Cria o schema do banco de dados
CREATE SCHEMA Atex;
USE Atex;

#Criação das Tabelas
CREATE TABLE cliente(
  id_Cliente INT NOT NULL,
  idade INT NOT NULL,
  nome VARCHAR(50) NOT NULL,
  nome_Escola VARCHAR(60)NOT NULL,
  anoEscolar INT NOT NULL,
  PRIMARY KEY(id_Cliente)
);

CREATE TABLE moderador(
  id_Moderador INT NOT NULL,
  email VARCHAR(255) NOT NULL,
  senha VARCHAR(15) NOT NULL,
  nome VARCHAR(50) NOT NULL,
  PRIMARY KEY(id_Moderador)
);

CREATE TABLE app(
  id_App INT NOT NULL,
  jogo_ou_rede BOOLEAN NOT NULL,
  nome VARCHAR(60) NOT NULL,
  id_Moderador INT NOT NULL,
  PRIMARY KEY(id_App),
  FOREIGN KEY (id_Moderador) REFERENCES moderador (id_Moderador)
);

CREATE TABLE perguntas(
  id_Pergunta INT NOT NULL,
  pergunta TEXT NOT NULL,
  id_App INT NOT NULL,
  PRIMARY KEY(id_Pergunta),
  FOREIGN KEY(id_App) REFERENCES app (id_App)
);

CREATE TABLE respostas(
  id_Resposta INT NOT NULL,
  resposta TEXT NOT NULL,
  id_Cliente INT NOT NULL,
  id_Pergunta INT NOT NULL,
  PRIMARY KEY(id_Resposta),
  FOREIGN KEY(id_Cliente) REFERENCES cliente(id_Cliente),
  FOREIGN KEY(id_Pergunta) REFERENCES pergunta(id_Pergunta)
);