-- --------     << TF_1A1_BrunoOliveira >>     ------------
--
--                    SCRIPT DE REMOCAO (DDL)
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
--                          1. Alteracao na ordem da tabela CATEGORIA deve ser removida antes da tabela MARCA
--                          2. Alteracao na ordem das tabelas ITEM_VENDA e VENDA deve ser removida antes das tabelas ITEM_PEDIDO e PEDIDO
--                          3. Remocao da view ESTOQUE
--                          4. Remocao da view PRODUTOS_VENCIDOS
--                    => 16/06/24 - Autor: Eduardo Silva
--                          1. Remocao dos Usuarios 'Leticia', 'Maria', 'Marina' e 'Ana'
--                          2. Remocao dos Perfis 'Consultora' e 'Cliente'
--
-- -----------------------------------

USE TF_1A1_BrunoOliveira;

-- Remoção das Views
DROP VIEW ESTOQUE;
DROP VIEW PRODUTOS_VENCIDOS;

-- Remoção das Tabelas
DROP TABLE telefone;
DROP TABLE PAGAMENTO_VENDA;
DROP TABLE ITEM_VENDA;
DROP TABLE VENDA;
DROP TABLE ITEM_PEDIDO;
DROP TABLE PEDIDO;
DROP TABLE PRODUTO;
DROP TABLE CATEGORIA;
DROP TABLE MARCA;
DROP TABLE CLIENTE;
DROP TABLE METODOS_DE_PAGAMENTO;

-- Remoção dos Usuarios
DROP USER IF EXISTS Leticia@'localhost';
DROP USER IF EXISTS Maria@'localhost';
DROP USER IF EXISTS Marina@'localhost';
DROP USER IF EXISTS Ana@'localhost';

-- Remoção dos Perfis
DROP ROLE IF EXISTS Consultora;
DROP ROLE IF EXISTS Cliente;