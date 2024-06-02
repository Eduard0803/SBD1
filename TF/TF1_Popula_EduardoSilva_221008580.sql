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

USE TF_scripts_1;

INSERT INTO METODOS_DE_PAGAMENTO (idMetodoPagamento, descricao) VALUES 
(1, 'Cartão de Crédito'),
(2, 'Boleto Bancário'),
(3, 'PayPal'),
(4, 'Transferência Bancária');

INSERT INTO CLIENTE (idCliente, nomeCliente, rua, bairro, numero, uf) VALUES 
(1, 'Ana Silva', 'Rua 3C Chácara 28', 'Setor Habitacional Vicente Pires', 705, 'DF'),
(2, 'Bruno Oliveira', 'Quadra 110 Conjunto 1', 'Samambaia', 728, 'DF'),
(3, 'Carlos Souza', 'Quadra CLS 209 Bloco B', 'Asa Sul', 417, 'DF'),
(4, 'Daniela Santos', 'Quadra QNM 20 Conjunto D', 'Ceilândia Norte (Ceilândia)', 247, 'DF');

INSERT INTO MARCA (idMarca, nomeMarca) VALUES 
(1, 'Natura'),
(2, 'Avon'),
(3, 'oBoticário'),
(4, 'Mary Kay');

INSERT INTO CATEGORIA (idCategoria, nomeCategoria) VALUES 
(1, 'Perfume'),
(2, 'Maquiagem'),
(3, 'Cabelos'),
(4, 'Hidratante Corporal');

INSERT INTO PRODUTO (idProduto, idMarca, idCategoria, nomeProduto) VALUES 
(1, 1, 1, 'Kaiak Masculino'),
(2, 2, 2, 'Delineador Retrátil para Olhos'),
(3, 3, 3, 'Shampoo Vegano Ultra Hidratação Nativa Spa Karité 300ml'),
(4, 4, 4, 'Loção Corporal Firmadora Targeted-Action® TimeWise 3D');

INSERT INTO VENDA (idVenda, idCliente, dataDaVenda) VALUES 
(1, 1, '2024-05-05'),
(2, 2, '2024-05-06'),
(3, 3, '2024-05-07'),
(4, 4, '2024-05-08');

INSERT INTO ITEM_VENDA (idVenda, idProduto, qtdProdutos, precoUnitario, precoUnitarioMedioPedido) VALUES 
(1, 1, 2, 10.00, 10.00),
(2, 2, 1, 20.00, 20.00),
(3, 3, 3, 30.00, 30.00),
(4, 4, 2, 40.00, 40.00);

INSERT INTO PAGAMENTO_VENDA (idVenda, idMetodoPagamento) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4);

INSERT INTO PEDIDO (idPedido, dataDaCompra) VALUES 
(1, '2024-01-15'),
(2, '2024-02-15'),
(3, '2024-03-15'),
(4, '2024-04-15');

INSERT INTO ITEM_PEDIDO (idPedido, idProduto, qtdProdutos, precoUnitario, dataDeValidade) VALUES 
(1, 1, 2, 10.00, '2025-03-24'),
(2, 2, 1, 20.00, '2024-07-25'),
(3, 3, 3, 30.00, '2025-12-28'),
(4, 4, 4, 40.00, '2024-11-02');

INSERT INTO telefone (idCliente, ddd, numero) VALUES 
(1, '11', '987654321'),
(2, '21', '987654322'),
(3, '31', '987654323'),
(4, '51', '987654324');
