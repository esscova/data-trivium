-- 4.1  O nome, o gênero e a profissão de todos os clientes, ordenado pelo nome em ordem decrescente
SELECT nome, genero, profissao FROM cliente ORDER BY nome DESC;

-- 4.2. Os clientes que tenham a letra “R” no nome
SELECT nome FROM cliente WHERE nome ILIKE '%r%'; --ILIKE ignora case sensitive

-- 4.3. Os clientes que o nome inicia com a letra “C”
SELECT nome FROM cliente WHERE nome ILIKE 'c%';

-- 4.4. Os clientes que o nome termina com a letra “A”
SELECT nome FROM cliente WHERE nome ILIKE '%a';

-- 4.5. Os clientes que moram no bairro “Centro”
SELECT nome, bairro FROM cliente WHERE bairro = 'Centro';

-- 4.6. Os clientes que moram em complementos que iniciam com a letra “A”
SELECT nome, complemento FROM cliente WHERE complemento ILIKE 'a%';

-- 4.7. Somente os clientes do sexo feminino
SELECT nome FROM cliente WHERE genero = 'F';

-- 4.8. Os clientes que não informaram o CPF
SELECT idcliente, nome FROM cliente WHERE cpf IS NULL;

-- 4.9. O nome e a profissão dos clientes, ordenado em ordem crescente pelo nome da profissão
SELECT nome, profissao FROM cliente ORDER BY profissao;

-- 4.10. Os clientes de nacionalidade “Brasileira”
SELECT idcliente, nome FROM cliente WHERE nacionalidade = 'Brasileira';

-- 4.11. Os clientes que informaram o número da residência
SELECT idcliente, nome FROM cliente WHERE numero IS NOT NULL;

-- 4.12. Os clientes que moram em Santa Catarina
SELECT idcliente, nome FROM cliente WHERE uf = 'SC';

-- 4.13. Os clientes que nasceram entre 01/01/2000 e 01/01/2002
SELECT idcliente, nome, data_nascimento FROM cliente WHERE data_nascimento BETWEEN '2000-01-01' AND '2002-01-01';

-- 4.14. O nome do cliente e o logradouro, número, complemento, bairro, município e UF concatenado de todos os clientes
SELECT
    nome,
    logradouro || ', ' || numero || ', ' || COALESCE(complemento || ', ', '') || bairro || ', ' || municipio || ' - ' || uf AS endereco_completo
FROM cliente;
/*
COALESCE no complemento, evita que sua ausência torne o endereço inteiro NULL 
(demais campos ausentes não recebem tratamento, pois nesse caso o endereço de fato não existe)
*/