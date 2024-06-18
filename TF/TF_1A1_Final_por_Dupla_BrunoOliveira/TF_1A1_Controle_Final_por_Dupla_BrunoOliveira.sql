-- --------     << TF_1A1_BrunoOliveira >>     ------------
--
--                    SCRIPT DE CONTROLE (DDL)
--
-- Data Criacao ...........: 14/06/2024
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
-- -----------------------------------


-- CRIACAO DO PERFIL CONSULTORA
CREATE ROLE 'Consultora';
GRANT ALL PRIVILEGES ON TF_1A1_BrunoOliveira.* TO Consultora;

CREATE USER 'Leticia'@'localhost' IDENTIFIED BY 'senhaLeticia';
CREATE USER 'Maria'@'localhost' IDENTIFIED BY 'senhaMaria';

GRANT Consultora TO Leticia@'localhost';
GRANT Consultora TO Maria@'localhost';

SET DEFAULT ROLE 'Consultora' TO 'Leticia'@'localhost';
SET DEFAULT ROLE 'Consultora' TO 'Maria'@'localhost';

-- CRIACAO DO PERFIL CLIENTE
CREATE ROLE 'Cliente';
GRANT SELECT ON TF_1A1_BrunoOliveira.ESTOQUE TO Cliente;

CREATE USER 'Marina'@'localhost' IDENTIFIED BY 'senhaMarina';
CREATE USER 'Ana'@'localhost' IDENTIFIED BY 'senhaAna';

GRANT Cliente TO Marina@'localhost';
GRANT Cliente TO Ana@'localhost';

SET DEFAULT ROLE 'Cliente' TO 'Marina'@'localhost';
SET DEFAULT ROLE 'Cliente' TO 'Ana'@'localhost';

FLUSH PRIVILEGES;
