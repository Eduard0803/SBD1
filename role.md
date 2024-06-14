Para criar um role (função) no MySQL, você pode usar os comandos `CREATE ROLE`, `GRANT`, e `SET ROLE`. Roles são uma forma conveniente de agrupar privilégios e atribuí-los a usuários. Aqui está um exemplo passo a passo de como criar e usar roles no MySQL:

1. **Criar uma role**:

```sql
CREATE ROLE 'gestor_vendas';
```

2. **Conceder privilégios à role**:

```sql
GRANT SELECT, INSERT, UPDATE ON database_name.* TO 'gestor_vendas';
```

3. **Atribuir a role a um usuário**:

```sql
GRANT 'gestor_vendas' TO 'usuario_vendas'@'localhost';
```

4. **Ativar a role para o usuário (opcional, se não for definida como padrão)**:

```sql
SET ROLE 'gestor_vendas';
```

5. **Verificar os privilégios da role**:

```sql
SHOW GRANTS FOR 'gestor_vendas';
```

6. **Definir uma role como padrão para um usuário**:

```sql
SET DEFAULT ROLE 'gestor_vendas' FOR 'usuario_vendas'@'localhost';
```

### Exemplo Completo

Vamos supor que você tem um banco de dados chamado `loja` e quer criar uma role para gerentes de vendas, concedendo permissões específicas a essa role e, em seguida, atribuí-la a um usuário:

1. **Criar a role `gestor_vendas`**:

```sql
CREATE ROLE 'gestor_vendas';
```

2. **Conceder privilégios à role**:

```sql
GRANT SELECT, INSERT, UPDATE ON loja.* TO 'gestor_vendas';
```

3. **Criar um usuário e atribuir a role a ele**:

```sql
CREATE USER 'usuario_vendas'@'localhost' IDENTIFIED BY 'senha_segura';
GRANT 'gestor_vendas' TO 'usuario_vendas'@'localhost';
```

4. **Definir a role como padrão para o usuário**:

```sql
SET DEFAULT ROLE 'gestor_vendas' FOR 'usuario_vendas'@'localhost';
```

Agora, o usuário `usuario_vendas` terá os privilégios definidos na role `gestor_vendas`. Esta abordagem facilita a gestão de privilégios, especialmente em ambientes com muitos usuários e complexos requisitos de acesso.