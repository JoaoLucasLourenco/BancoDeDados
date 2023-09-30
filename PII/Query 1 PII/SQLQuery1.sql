-- Tabela user
CREATE TABLE [user] (
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

-- Tabela radioButton
CREATE TABLE radioButton (
    IdTableRdBtn INT PRIMARY KEY,
    Pergunta NVARCHAR(255),
    Resposta1 NVARCHAR(255),
    Resposta2 NVARCHAR(255),
    Resposta3 NVARCHAR(255)
);

-- Tabela txtBoxPergunta
CREATE TABLE txtBoxPergunta (
    IdBoxPergunta INT PRIMARY KEY,
    Pergunta NVARCHAR(255)
);

-- Tabela txtBoxResposta
CREATE TABLE txtBoxResposta (
    IdBoxResposta INT PRIMARY KEY,
    IdBoxPergunta INT,
    Resposta NVARCHAR(255),
    FOREIGN KEY (IdBoxPergunta) REFERENCES txtBoxPergunta(IdBoxPergunta)
);

-- Tabela relatorio
CREATE TABLE relatorio (
    IdRelatorio INT PRIMARY KEY,
    IdJogo INT,
    IdRede INT,
    Informacoes TEXT,
    FOREIGN KEY (IdJogo) REFERENCES jogo(IdJogo),
    FOREIGN KEY (IdRede) REFERENCES rede(IdRede)
);

-- Tabela jogo
CREATE TABLE jogo (
    IdJogo INT PRIMARY KEY,
    Nome NVARCHAR(55),
    CaminhoImagem NVARCHAR(MAX),
    IdTableRdBtn INT,
    IdBoxPergunta INT,
    FOREIGN KEY (IdTableRdBtn) REFERENCES radioButton(IdTableRdBtn),
    FOREIGN KEY (IdBoxPergunta) REFERENCES txtBoxPergunta(IdBoxPergunta)
);

-- Tabela rede
CREATE TABLE rede (
    IdRede INT PRIMARY KEY,
    Nome NVARCHAR(55),
    CaminhoImagem NVARCHAR(MAX),
    IdTableRdBtn INT,
    IdBoxPergunta1 INT,
    IdBoxPergunta2 INT,
    IdBoxPergunta3 INT,
    FOREIGN KEY (IdTableRdBtn) REFERENCES radioButton(IdTableRdBtn),
    FOREIGN KEY (IdBoxPergunta1) REFERENCES txtBoxPergunta(IdBoxPergunta),
    FOREIGN KEY (IdBoxPergunta2) REFERENCES txtBoxPergunta(IdBoxPergunta),
    FOREIGN KEY (IdBoxPergunta3) REFERENCES txtBoxPergunta(IdBoxPergunta)
);
