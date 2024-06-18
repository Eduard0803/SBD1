-- --------     << TF_1A1_BrunoOliveira >>     ------------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 02/06/2024
-- Autor(es) ..............: BRUNO OLIVEIRA, EDUARDO SILVA
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_1A1_BrunoOliveira
--
--
-- PROJETO => 01 Base de Dados
--         => 11 Tabelas
--         => 02 Visoes
--         => 02 Perfis (role)
--         => 04 Usuarios
--
-- ULTIMAS ALTERACOES => 14/06/24 - Autor: Eduardo Silva
--                          1. Inclusao do atributo 'taxaProcessamento' na tabela METODOS_DE_PAGAMENTO
--                          2. Inclusao do atributo 'sexo' na tabela PRODUTO
--                          3. Inclusao do atributo 'sexo' na tabela CLIENTE
--                          4. Inclusao do atributo 'complemento' na tabela CLIENTE
--                          5. Inclusao do atributo 'statusVenda' na tabela VENDA
--                          6. Alteracao na ordem das tabelas PEDIDO e ITEM_PEDIDO devem ser criadas antes da tabela VENDA e ITEM_VENDA
--                          7. Criacao da view ESTOQUE
--                          8. Criacao da view PRODUTOS_VENCIDOS
--
-- -----------------------------------

CREATE DATABASE 
    IF NOT EXISTS TF_1A1_BrunoOliveira;
USE TF_1A1_BrunoOliveira;

CREATE TABLE METODOS_DE_PAGAMENTO (
    idMetodoPagamento INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,
    taxaProcessamento DECIMAL(5, 2) NOT NULL,
    CONSTRAINT METODOS_PAGAMENTO_PK PRIMARY KEY (idMetodoPagamento)
) ENGINE = InnoDB;

CREATE TABLE CLIENTE (
    idCliente INT NOT NULL AUTO_INCREMENT,
    nomeCliente VARCHAR(100) NOT NULL,
    rua VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    numero INT NOT NULL,
    uf CHAR(2) NOT NULL,
    sexo ENUM('M', 'F', 'U') NOT NULL,
    complemento VARCHAR(100),
    CONSTRAINT CLIENTE_PK PRIMARY KEY (idCliente)
) ENGINE = InnoDB;

CREATE TABLE MARCA (
    idMarca INT NOT NULL AUTO_INCREMENT,
    nomeMarca VARCHAR(100) NOT NULL,
    CONSTRAINT MARCA_PK PRIMARY KEY (idMarca)
) ENGINE = InnoDB;

CREATE TABLE CATEGORIA (
    idCategoria INT NOT NULL AUTO_INCREMENT,
    nomeCategoria VARCHAR(100) NOT NULL,
    CONSTRAINT CATEGORIA_PK PRIMARY KEY (idCategoria)
) ENGINE = InnoDB;

CREATE TABLE PRODUTO (
    idProduto INT NOT NULL AUTO_INCREMENT,
    idMarca INT NOT NULL,
    idCategoria INT NOT NULL,
    nomeProduto VARCHAR(100) NOT NULL,
    sexo ENUM('M', 'F', 'U') NOT NULL,
    CONSTRAINT PRODUTO_PK PRIMARY KEY (idProduto),
    CONSTRAINT PRODUTO_MARCA_FK FOREIGN KEY (idMarca) REFERENCES MARCA (idMarca)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT PRODUTO_CATEGORIA_FK FOREIGN KEY (idCategoria) REFERENCES CATEGORIA (idCategoria)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE PEDIDO (
    idPedido INT NOT NULL AUTO_INCREMENT,
    dataDaCompra DATE NOT NULL,
    CONSTRAINT PEDIDO_PK PRIMARY KEY (idPedido)
) ENGINE = InnoDB;

CREATE TABLE ITEM_PEDIDO (
    idPedido INT NOT NULL,
    idProduto INT NOT NULL,
    qtdProdutos INT NOT NULL,
    precoUnitario DECIMAL(10, 2) NOT NULL,
    dataDeValidade DATE NOT NULL,
    CONSTRAINT ITEM_PEDIDO_PEDIDO_FK FOREIGN KEY (idPedido) REFERENCES PEDIDO (idPedido)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT ITEM_PEDIDO_PRODUTO_FK FOREIGN KEY (idProduto) REFERENCES PRODUTO (idProduto)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE VENDA (
    idVenda INT NOT NULL AUTO_INCREMENT,
    idCliente INT NOT NULL,
    dataDaVenda DATE NOT NULL,
    statusVenda ENUM("Preparando", "A caminho", "Entregue") NOT NULL,
    CONSTRAINT VENDA_PK PRIMARY KEY (idVenda),
    CONSTRAINT VENDA_CLIENTE_FK FOREIGN KEY (idCliente) REFERENCES CLIENTE (idCliente)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE ITEM_VENDA (
    idVenda INT NOT NULL,
    idProduto INT NOT NULL,
    qtdProdutos INT NOT NULL,
    precoUnitario DECIMAL(10, 2) NOT NULL,
    precoUnitarioMedioPedido DECIMAL(10, 2) NOT NULL,
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

CREATE TABLE telefone (
    idCliente INT NOT NULL,
    ddd VARCHAR(2) NOT NULL,
    numero VARCHAR(9) NOT NULL,
    CONSTRAINT telefone_idCliente_ddd_numero_UK UNIQUE (idCliente, numero, ddd),
    CONSTRAINT telefone_CLIENTE_FK FOREIGN KEY (idCliente) REFERENCES CLIENTE (idCliente)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE VIEW ESTOQUE AS
    SELECT 
        ip.idProduto,
        p.nomeProduto,
        m.nomeMarca,
        c.nomeCategoria,
        (IFNULL(SUM(ip.qtdProdutos), 0) - IFNULL(SUM(iv.qtdProdutos), 0)) AS qtdProdutosDisponiveis
    FROM 
        ITEM_PEDIDO ip
    LEFT JOIN 
        ITEM_VENDA iv ON ip.idProduto = iv.idProduto
    JOIN
        PRODUTO p ON ip.idProduto = p.idProduto
    JOIN
        MARCA m ON p.idMarca = m.idMarca
    JOIN
        CATEGORIA c ON p.idCategoria = c.idCategoria
    WHERE 
        ip.dataDeValidade >= CURDATE()
    GROUP BY 
        ip.idProduto, ip.qtdProdutos;

CREATE VIEW PRODUTOS_VENCIDOS AS
    SELECT 
        ip.idProduto,
        p.nomeProduto,
        m.nomeMarca,
        c.nomeCategoria,
        (IFNULL(SUM(ip.qtdProdutos), 0) - IFNULL(SUM(iv.qtdProdutos), 0)) AS qtdProdutosVencidos
    FROM 
        ITEM_PEDIDO ip
    LEFT JOIN 
        ITEM_VENDA iv ON ip.idProduto = iv.idProduto
    JOIN
        PRODUTO p ON ip.idProduto = p.idProduto
    JOIN
        MARCA m ON p.idMarca = m.idMarca
    JOIN
        CATEGORIA c ON p.idCategoria = c.idCategoria
    WHERE 
        ip.dataDeValidade < CURDATE()
    GROUP BY 
        ip.idProduto, ip.qtdProdutos;
