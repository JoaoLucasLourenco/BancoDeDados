-- Tabela user
CREATE TABLE usuario (
    IdUser INT PRIMARY KEY,
    Idade INT,
    Nome NVARCHAR(50),
    Escola NVARCHAR(50),
    Ano_Escolar INT
);




-- Tabela APP
CREATE TABLE app (
    idApp INT PRIMARY KEY,
    Nome NVARCHAR(55),
	idTutorial INT,
	JogoOuRede BIT,
    CaminhoImagem NVARCHAR(MAX)
);


-- Tabela moderador
CREATE TABLE moderador (
    IdModerador INT PRIMARY KEY,
    Email NVARCHAR(50),
    Nome NVARCHAR(50),
    Senha NVARCHAR(50)
);


-- Tabela Pergunta Fechada
CREATE TABLE pergunta (
    idPergunta INT PRIMARY KEY,
    descricao NVARCHAR(255),
	idApp INT,
	FOREIGN KEY (idApp) REFERENCES app(idApp)
);

--Op��es
CREATE TABLE opcao(
	idOpcao INT PRIMARY KEY,
    descricao NVARCHAR(255),
	idPerguntaFechada INT,
	FOREIGN KEY (idPerguntaFechada) REFERENCES pergunta(idPergunta)
);



-- Tabela Resposta Fechada
CREATE TABLE escolhaOpcaoUsuario(
	idRespostaFechada INT PRIMARY KEY,
	idOpcao INT,
	idUser INT,
	FOREIGN KEY (idOpcao) REFERENCES opcao(idOpcao),
	FOREIGN KEY (idUser) REFERENCES usuario(idUser)
);


-- Tabela Pergunta Aberta Resposta
CREATE TABLE respostaAberta (
    idBoxResposta INT PRIMARY KEY,
    idPergAberta INT,
	idUser INT,
    Resposta NVARCHAR(255),
    FOREIGN KEY (idPergAberta) REFERENCES pergunta(idPergunta),
	FOREIGN KEY (idUser) REFERENCES usuario(idUser)
);


