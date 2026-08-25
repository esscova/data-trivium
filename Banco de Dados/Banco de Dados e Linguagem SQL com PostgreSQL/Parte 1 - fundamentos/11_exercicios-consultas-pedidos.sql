/* 
    Consultas simples com pedidos, produtos, vendedores e transportadoras
*/

-- 11.1. Somente o nome de todos os vendedores em ordem alfabética.
SELECT nome FROM vendedor ORDER BY nome;

-- 11.2. Os produtos que o preço seja maior que R$ 200,00, em ordem crescente pelo preço.
SELECT idproduto, nome, valor
FROM produto 
WHERE valor > 200
ORDER BY valor;

-- 11.3. O nome do produto, o preço e o preço reajustado em 10%, ordenado pelo nome do produto.
SELECT 
    nome,
    valor,
    (valor * 1.10)::NUMERIC(12,2) AS valor_reajustado -- cast para campo ou ROUND()
FROM produto
ORDER BY nome;

-- 11.4. Os municípios do Rio Grande do Sul :: iduf = 21
SELECT nome FROM municipio WHERE iduf = 21;

-- 11.5. Os pedidos feitos entre 10/04/2008 e 25/04/2008, ordenado pelo valor.
SELECT * 
FROM pedido 
WHERE data_pedido BETWEEN '2008-04-10' AND '2008-04-25'
ORDER BY valor;

-- 11.6. Os pedidos que o valor esteja entre R$ 1.000,00 e R$ 1.500,00.
SELECT *
FROM pedido
WHERE valor BETWEEN 1000 AND 1500;

-- 11.7. Os pedidos que o valor não esteja entre R$ 100,00 e R$ 500,00.
SELECT *
FROM pedido
WHERE valor NOT BETWEEN 100 AND 500;

-- 11.8. Os pedidos do vendedor André, ordenado pelo valor em ordem decrescente. :: idvendedor = 1
SELECT * 
FROM pedido 
WHERE idvendedor = 1 
ORDER BY valor
DESC;

-- 11.9. Os pedidos do cliente Manoel, ordenado pelo valor em ordem crescente. :: idcliente = 1
SELECT * FROM pedido WHERE idcliente = 1 ORDER BY valor;

-- 11.10. Os pedidos da cliente Jéssica que foram feitos pelo vendedor André. :: idcliente = 15 :: idvendedor = 1
SELECT * FROM pedido
WHERE idcliente = 15 AND idvendedor = 1;

-- 11.11. Os pedidos que foram transportados pela transportadora União Transportes. :: idtransportadora = 2
SELECT * FROM pedido WHERE idtransportadora = 2;

-- 11.12. Os pedidos feitos pela vendedora Maria ou pela vendedora Aline. :: 5|7
SELECT * FROM pedido WHERE idvendedor IN (5,7);

-- 11.13. Os clientes que moram em União da Vitória ou Porto União. :: 1|9
-- SELECT * FROM cliente WHERE idmunicipio = 1 or idmunicipio=9;
SELECT * FROM cliente WHERE idmunicipio IN (1,9);

-- 11.14. Os clientes que não moram em União da Vitória e nem em Porto União.
SELECT * FROM cliente WHERE idmunicipio NOT IN (1,9);

-- 11.15. Os clientes que não informaram o logradouro.
SELECT nome, idcliente FROM cliente WHERE logradouro is NULL;

-- 11.16. Os clientes que moram em avenidas.
SELECT * FROM cliente WHERE logradouro ILIKE 'Av%';

-- 11.17. Os vendedores que o nome começa com a letra S.
SELECT * FROM vendedor WHERE nome ILIKE 's%';

-- 11.18. Os vendedores que o nome termina com a letra A.
SELECT * FROM vendedor WHERE nome ILIKE '%a';

-- 11.19. Os vendedores que o nome não começa com a letra A.
SELECT * FROM vendedor WHERE nome NOT ILIKE 'a%';

-- 11.20. Os municípios que começam com a letra P e são de Santa Catarina. :: iduf 24
SELECT * FROM municipio WHERE nome ILIKE 'p%' AND iduf = 24;

-- 11.21. As transportadoras que informaram o endereço.
SELECT * FROM transportadora WHERE logradouro IS NOT NULL;

-- 11.22. Os itens do pedido 01.
SELECT * FROM pedido_produto WHERE idpedido = 1;

-- 11.23. Os itens do pedido 06 ou do pedido 10.
SELECT * FROM pedido_produto WHERE idpedido = 6 OR idpedido = 10;