CREATE Table prato(
    id_prato INT NOT NULL,
    nome VARCHAR(60) NULL,
    descricao TEXT NOT NULL,
    dataOfertado DATE NOT NULL,
    PRIMARY KEY(id_prato)
);
CREATE TABLE marmita(
    id_marmita INT NOT NULL,
    tamanho CHAR NOT NULL,
    preco DECIMAL(5,2) NOT NULL,
    PRIMARY KEY(id_marmita)
);
CREATE TABLE cliente(
    id_cliente INT NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    idCliEnd INT NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    PRIMARY KEY(id_cliente),
    FOREIGN KEY(idCliEnd) REFERENCES end_cliente(idCliEnd)
);
CREATE TABLE pedido(
    id_pedido INT NOT NULL,
    id_cliente INT NOT NULL,
    idEndEntrega INT NOT NULL,
    idPedidoPrato INT NOT NULL,
    id_cupom INT NOT NULL,
    data_pedido DATE NOT NULL,
    tipoEntrega BOOLEAN NOT NULL,
    formaPag VARCHAR(20) NOT NULL,
    PRIMARY KEY(id_pedido),
    FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY(idEndEntrega) REFERENCES end_entrega(idEndEntrega),
    FOREIGN KEY(idPedidoPrato) REFERENCES pedido_prato(idPedidoPrato),
    FOREIGN KEY(id_cupom) REFERENCES cupom(id_cupom)
);
CREATE TABLE pedido_prato(
    idPedidoPrato INT NOT NULL,
    id_pedido INT NOT NULL,
    id_prato INT NOT NULL,
    id_marmita INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY(idPedidoPrato),
    FOREIGN KEY(id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY(id_prato) REFERENCES prato(id_prato),
    FOREIGN KEY(id_marmita) REFERENCES marmita(id_marmita)
);
CREATE TABLE end_cliente(
    idCliEnd INT NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero INT NOT NULL,
    complemento VARCHAR(20) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cep INT NOT NULL,
    id_cliente INT NOT NULL,
    PRIMARY KEY(idCliEnd),
    FOREIGN KEY(id_cliente) REFERENCES cliente (id_cliente)
);
CREATE TABLE end_entrega(
    idEndEntrega INT NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero INT NOT NULL,
    complemento VARCHAR(20) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cep INT NOT NULL,
    id_pedido INT,
    PRIMARY KEY(idEndEntrega),
    FOREIGN KEY(id_pedido) REFERENCES pedido(id_pedido)
);
CREATE TABLE cupom(
    id_cupom INT NOT NULL,
    cupom VARCHAR(20),
    PRIMARY KEY(id_cupom)
);