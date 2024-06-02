Para criar a VIEW `ESTOQUE` que retorna o `idProduto` e a diferença entre a quantidade de produtos pedidos (`ip.qtdProdutos`) e a quantidade de produtos vendidos (`iv.qtdProdutos`), considerando apenas os produtos cujo `dataDeValidade` seja maior ou igual à data atual, você pode utilizar a seguinte consulta:

```sql
CREATE VIEW ESTOQUE AS
SELECT 
    ip.idProduto,
    (ip.qtdProdutos - IFNULL(SUM(iv.qtdProdutos), 0)) AS qtdProdutosNaoVendidos
FROM 
    ITEM_PEDIDO ip
LEFT JOIN 
    ITEM_VENDA iv ON ip.idProduto = iv.idProduto
WHERE 
    ip.dataDeValidade >= CURDATE()
GROUP BY 
    ip.idProduto, ip.qtdProdutos;
```

Esta VIEW faz o seguinte:
1. Faz uma junção (LEFT JOIN) entre `ITEM_PEDIDO` e `ITEM_VENDA` usando o campo `idProduto`.
2. Filtra os registros de `ITEM_PEDIDO` onde `dataDeValidade` é maior ou igual à data atual (`CURDATE()`).
3. Agrupa os resultados por `idProduto` e `ip.qtdProdutos`.
4. Calcula a diferença entre a quantidade de produtos pedidos e vendidos usando `ip.qtdProdutos - IFNULL(SUM(iv.qtdProdutos), 0)`, onde `IFNULL` é usado para tratar casos onde não há registros na tabela `ITEM_VENDA` para um produto específico.

Agora você pode consultar a VIEW `ESTOQUE` para obter a lista de produtos, a quantidade pedida e a quantidade restante não vendida.

```sql
SELECT * FROM ESTOQUE;
```