-- --------     << TF_scripts_1 >>     ------------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 02/06/2024
-- Autor(es) ..............: BRUNO OLIVEIRA, EDUARDO SILVA
-- Banco de Dados .........: MySQL
-- Base de Dados (nome) ...: TF_scripts_1
--
--
-- PROJETO => 01 Base de Dados
--         => 11 Tabelas
-- -----------------------------------

CREATE DATABASE 
    IF NOT EXISTS TF_scripts_1;
USE TF_scripts_1;

CREATE TABLE METODOS_DE_PAGAMENTO (
    idMetodoPagamento INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(100),
    CONSTRAINT METODOS_PAGAMENTO_PK PRIMARY KEY (idMetodoPagamento)
) ENGINE = InnoDB;

CREATE TABLE CLIENTE (
    idCliente INT NOT NULL AUTO_INCREMENT,
    nomeCliente VARCHAR(100),
    rua VARCHAR(100),
    bairro VARCHAR(100),
    numero INT,
    uf CHAR(2),
    CONSTRAINT CLIENTE_PK PRIMARY KEY (idCliente)
) ENGINE = InnoDB;

CREATE TABLE MARCA (
    idMarca INT NOT NULL AUTO_INCREMENT,
    nomeMarca VARCHAR(100),
    CONSTRAINT MARCA_PK PRIMARY KEY (idMarca)
) ENGINE = InnoDB;

CREATE TABLE CATEGORIA (
    idCategoria INT NOT NULL AUTO_INCREMENT,
    nomeCategoria VARCHAR(100),
    CONSTRAINT CATEGORIA_PK PRIMARY KEY (idCategoria)
) ENGINE = InnoDB;

CREATE TABLE PRODUTO (
    idProduto INT NOT NULL AUTO_INCREMENT,
    idMarca INT NOT NULL,
    idCategoria INT NOT NULL,
    nomeProduto VARCHAR(100),
    CONSTRAINT PRODUTO_PK PRIMARY KEY (idProduto),
    CONSTRAINT PRODUTO_MARCA_FK FOREIGN KEY (idMarca) REFERENCES MARCA (idMarca)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT PRODUTO_CATEGORIA_FK FOREIGN KEY (idCategoria) REFERENCES CATEGORIA (idCategoria)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE VENDA (
    idVenda INT NOT NULL AUTO_INCREMENT,
    idCliente INT NOT NULL,
    dataDaVenda DATE,
    CONSTRAINT VENDA_PK PRIMARY KEY (idVenda),
    CONSTRAINT VENDA_CLIENTE_FK FOREIGN KEY (idCliente) REFERENCES CLIENTE (idCliente)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE ITEM_VENDA (
    idVenda INT NOT NULL,
    idProduto INT NOT NULL,
    qtdProdutos INT,
    precoUnitario DECIMAL(10, 2),
    precoUnitarioMedioPedido DECIMAL(10, 2),
    CONSTRAINT ITEM_VENDA_VENDA_FK FOREIGN KEY (idVenda) REFERENCES VENDA (idVenda)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT ITEM_VENDA_PRODUTO_FK FOREIGN KEY (idProduto) REFERENCES PRODUTO (idProduto)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE PAGAMENTO_VENDA (
    idVenda INT NOT NULL,
    idMetodoPagamento INT NOT NULL,
    CONSTRAINT PAGAMENTO_VENDA_VENDA_FK FOREIGN KEY (idVenda) REFERENCES VENDA (idVenda)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT PAGAMENTO_VENDA_METODOS_DE_PAGAMENTO_FK FOREIGN KEY (idMetodoPagamento) REFERENCES METODOS_DE_PAGAMENTO (idMetodoPagamento)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE PEDIDO (
    idPedido INT NOT NULL AUTO_INCREMENT,
    dataDaCompra DATE,
    CONSTRAINT PEDIDO_PK PRIMARY KEY (idPedido)
) ENGINE = InnoDB;

CREATE TABLE ITEM_PEDIDO (
    idPedido INT NOT NULL,
    idProduto INT NOT NULL,
    qtdProdutos INT,
    precoUnitario DECIMAL(10, 2),
    dataDeValidade DATE,
    CONSTRAINT ITEM_PEDIDO_PEDIDO_FK FOREIGN KEY (idPedido) REFERENCES PEDIDO (idPedido)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT ITEM_PEDIDO_PRODUTO_FK FOREIGN KEY (idProduto) REFERENCES PRODUTO (idProduto)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE telefone (
    idCliente INT NOT NULL,
    ddd VARCHAR(2),
    numero VARCHAR(9),
    CONSTRAINT telefone_idCliente_ddd_numero_UK UNIQUE (idCliente, numero, ddd),
    CONSTRAINT telefone_CLIENTE_FK FOREIGN KEY (idCliente) REFERENCES CLIENTE (idCliente)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;
