create database
    if not exists self_join;

use self_join;

create table funcionario (
    id int auto_increment,
    nome varchar(100),
    id_gerente int,
    constraint funcionario_pk primary key (id),
    constraint funcionario_funcionario_fk foreign key (id_gerente) references funcionario(id)
) engine = InnoDB;

insert into funcionario (nome, id_gerente) values
    ('joao', null),
    ('maria', 1),
    ('pedro', 1),
    ('jose', 3),
    ('ana', 3);
