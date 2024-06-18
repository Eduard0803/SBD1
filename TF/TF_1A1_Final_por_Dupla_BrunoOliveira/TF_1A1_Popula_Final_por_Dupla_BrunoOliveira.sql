-- --------     << TF_1A1_BrunoOliveira >>     ------------
--
--                    SCRIPT DE INSERCAO (DML)
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
---- ULTIMAS ALTERACOES => 15/06/24 - Autor: Eduardo Silva
--                          1. Insercao do atributo 'taxaProcessamento' em METODOS_DE_PAGAMENTO
--                          2. Insercao do atributo 'sexo' em PRODUTO
--                          3. Insercao do atributo 'sexo' em CLIENTE
--                          5. Insercao do atributo 'statusVenda' em VENDA
--
-- -----------------------------------

USE TF_1A1_BrunoOliveira;

INSERT INTO METODOS_DE_PAGAMENTO (descricao, taxaProcessamento) VALUES 
('Cartão de Crédito', 2),
('Boleto Bancário', 0),
('PIX', 0),
('Transferência Bancária', 0),
('Dinheiro', 0);

INSERT INTO CLIENTE (nomeCliente, rua, bairro, numero, uf, sexo) VALUES 
('Ana Silva', 'Rua 3C Chácara 28', 'Setor Habitacional Vicente Pires', 705, 'DF', 'F'),
('Bruno Oliveira', 'Quadra 110 Conjunto 1', 'Samambaia', 728, 'DF', 'M'),
('Carlos Souza', 'Quadra CLS 209 Bloco B', 'Asa Sul', 417, 'DF', 'M'),
('Daniela Santos', 'Quadra QNM 20 Conjunto D', 'Ceilândia Norte (Ceilândia)', 247, 'DF', 'F'),
('Kauê Assunção', 'Quadra QN 507 Conjunto 5', 'Samambaia Sul (Samambaia)', 119, 'DF', 'M');

INSERT INTO MARCA (nomeMarca) VALUES 
('Natura'),
('Jequiti'),
('oBoticário'),
('Mary Kay'),
('Eudora');

INSERT INTO CATEGORIA (nomeCategoria) VALUES 
('Perfume'),
('Maquiagem'),
('Cabelos'),
('Hidratante Corporal'),
('Corpo e Banho');

INSERT INTO PRODUTO (idMarca, idCategoria, nomeProduto, sexo) VALUES 
(1, 1, 'Kaiak Masculino', 'M'),
(2, 2, 'Batom Matte Ellas Jequiti', 'F'),
(3, 3, 'Shampoo Vegano Ultra Hidratação Nativa Spa Karité 300ml', 'U'),
(4, 4, 'Loção Corporal Firmadora Targeted-Action® TimeWise 3D', 'F'),
(5, 5, 'Body Spray Desodorante Imensi 100ml', 'F');

INSERT INTO VENDA (idCliente, dataDaVenda, statusVenda) VALUES 
(1, '2024-05-05', "Entregue"),
(2, '2024-05-06', "Entregue"),
(3, '2024-05-07', "Entregue"),
(4, '2024-05-08', "Entregue"),
(5, '2024-05-09', "Entregue");

INSERT INTO ITEM_VENDA (idVenda, idProduto, qtdProdutos, precoUnitario, precoUnitarioMedioPedido) VALUES 
(1, 1, 2, 10.00, 10.00),
(2, 2, 1, 20.00, 20.00),
(3, 3, 3, 30.00, 30.00),
(4, 4, 2, 40.00, 40.00),
(5, 5, 6, 40.00, 40.00);

INSERT INTO PAGAMENTO_VENDA (idVenda, idMetodoPagamento) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 3);

INSERT INTO PEDIDO (dataDaCompra) VALUES 
('2024-01-15'),
('2024-02-15'),
('2024-03-15'),
('2024-04-15'),
('2024-05-15');

INSERT INTO ITEM_PEDIDO (idPedido, idProduto, qtdProdutos, precoUnitario, dataDeValidade) VALUES 
(1, 1, 2, 10.00, '2025-03-24'),
(2, 2, 1, 20.00, '2024-07-25'),
(3, 3, 3, 30.00, '2025-12-28'),
(4, 4, 4, 40.00, '2024-11-02'),
(5, 5, 10, 39.99, '2026-06-19'),
(5, 4, 10, 39.99, '2023-06-19');

INSERT INTO telefone (idCliente, ddd, numero) VALUES 
(1, '61', '987654321'),
(2, '61', '987654322'),
(3, '61', '987654323'),
(4, '61', '987654324'),
(5, '61', '993982665');
