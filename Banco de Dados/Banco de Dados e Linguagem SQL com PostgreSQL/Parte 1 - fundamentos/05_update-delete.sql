-- EXERCICIO 05 - COMANDOS UPDATE E DELETE

/* 
    5.1. Inserir dados na tabela de clientes
*/
INSERT INTO cliente
    (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf) 
VALUES
    (16, 'Maicon', '12349596421', '1234', '1965-10-10', 'F', 'Empresário', NULL, NULL, NULL, NULL, NULL, 'Florianópolis', 'PR'),
    (17, 'Getúlio', NULL, '4631', NULL, 'F', 'Estudante', 'Brasileira', 'Rua Central', '343', 'Apartamento', 'Centro', 'Curitiba', 'SC'),
    (18, 'Sandra', NULL, NULL, NULL, 'M', 'Professor', 'Italiana', NULL, '12', 'Bloco A', NULL, NULL, NULL)
;

/*
    5.2. Altere os dados do cliente Maicon :: idcliente = 16
*/

-- 5.2.1. O CPF para 45390569432
UPDATE cliente SET cpf = '45390569432' WHERE idcliente = 16;

-- 5.2.2. O gênero para M
UPDATE cliente SET genero = 'M' WHERE idcliente = 16;

-- 5.2.3. A nacionalidade para Brasileira
UPDATE cliente SET nacionalidade = 'Brasileira' WHERE idcliente = 16;

-- 5.2.4. O UF para SC
UPDATE cliente SET uf = 'SC' WHERE idcliente = 16;

/*
    5.3. Altere os dados do cliente Getúlio :: idcliente = 17
*/

-- 5.3.1. A data de nascimento para 01/04/1978
UPDATE cliente SET data_nascimento = '1978-04-01' WHERE idcliente = 17;

-- 5.3.2. O gênero para M
UPDATE cliente SET genero = 'M' WHERE idcliente = 17;

/*
    5.4. Altere os dados da cliente Sandra :: idcliente = 18
*/

-- 5.4.1. O gênero para F
UPDATE cliente SET genero = 'F' WHERE idcliente = 18;

-- 5.4.2. A profissão para Professora
UPDATE cliente SET profissao = 'Professora' WHERE idcliente = 18;

-- 5.4.3. O número para 123
UPDATE cliente SET numero = '123' WHERE idcliente = 18;

/*
    5.5. Apague o cliente Maicon :: idcliente = 16
*/
DELETE FROM cliente WHERE idcliente = 16;

/*
    5.6. Apague a cliente Sandra :: idcliente = 18
*/
DELETE FROM cliente WHERE idcliente = 18;