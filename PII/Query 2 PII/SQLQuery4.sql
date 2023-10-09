-- Tabela user
CREATE TABLE usuario (
    IdUser INT PRIMARY KEY,
    Idade INT,
    Nome NVARCHAR(50),
    Escola NVARCHAR(50),
    Ano_Escolar INT
);

-- Tabela moderador
CREATE TABLE moderador (
    IdModerador INT PRIMARY KEY,
    Email NVARCHAR(50),
    Nome NVARCHAR(50),
    Senha NVARCHAR(50)
);

--Opções
CREATE TABLE opcoes(
	idOpcao INT PRIMARY KEY,
    opcao NVARCHAR(255),
);

-- Tabela Pergunta Fechada
CREATE TABLE pergFechada (
    idPergFechada INT PRIMARY KEY,
    Pergunta NVARCHAR(255),
    idOpcao1 INT,
    idOpcao2 INT,
    idOpcao3 INT,
	FOREIGN KEY (idOpcao1) REFERENCES opcoes(idOpcao),
	FOREIGN KEY (idOpcao2) REFERENCES opcoes(idOpcao),
	FOREIGN KEY (idOpcao3) REFERENCES opcoes(idOpcao)
);

-- Tabela Resposta Fechada
CREATE TABLE respostaFechada(
	idRespostaFechada INT PRIMARY KEY,
	idOpcao INT,
	idPergunta INT,
	idUser INT,
	FOREIGN KEY (idOpcao) REFERENCES opcoes(idOpcao),
    FOREIGN KEY (idPergunta) REFERENCES pergFechada(idPergFechada),
	FOREIGN KEY (idUser) REFERENCES usuario(idUser)
);

-- Tabela Pergunta Aberta
CREATE TABLE idPergAberta(
    idPergAberta INT PRIMARY KEY,
    Pergunta NVARCHAR(255)
);

-- Tabela Pergunta Aberta Resposta
CREATE TABLE respostaAberta (
    idBoxResposta INT PRIMARY KEY,
    idPergAberta INT,
	idUser INT,
    Resposta NVARCHAR(255),
    FOREIGN KEY (idPergAberta) REFERENCES idPergAberta(idPergAberta),
	FOREIGN KEY (idUser) REFERENCES usuario(idUser)
);

-- Tabela APP
CREATE TABLE App (
    IdApp INT PRIMARY KEY,
    Nome NVARCHAR(55),
	idTutorial INT,
	JogoOuRede BIT,
    CaminhoImagem NVARCHAR(MAX)
);

--Tabela Perguntas Fechadas App
CREATE TABLE perguntasFechadasApp (
	idPerguntasFechadasApp INT PRIMARY KEY,
	idPerguntaFechada INT,
	idApp INT,
	FOREIGN KEY (idPerguntaFechada) REFERENCES pergFechada(idPergFechada),
	FOREIGN KEY (idApp) REFERENCES App(idApp)
);

--Tabela Perguntas Abertas App
CREATE TABLE perguntasAbertasApp (
	idPerguntasAbertasApp INT PRIMARY KEY,
	idPerguntaAberta INT,
	idApp INT,
	FOREIGN KEY (idPerguntaAberta) REFERENCES idPergAberta(idPergAberta),
	FOREIGN KEY (idApp) REFERENCES App(idApp)
);

-- Tabela tutorial
CREATE TABLE tutorial (
    IdTutorial INT PRIMARY KEY,
	nome NVARCHAR(255),
    caminhoArquivo NVARCHAR(MAX)
);

--Relacionando tutorial com app
ALTER TABLE App
ADD FOREIGN KEY (idTutorial) REFERENCES tutorial(IdTutorial);


