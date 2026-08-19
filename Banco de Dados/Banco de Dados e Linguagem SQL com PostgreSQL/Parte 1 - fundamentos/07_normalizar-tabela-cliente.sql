-- NORMALIZAR CLIENTE 

/*
    7.1. Profissao
*/

SELECT * FROM profissao;

-- criar campo
ALTER TABLE cliente ADD idprofissao INTEGER;

-- referenciar tabelas
ALTER TABLE cliente ADD CONSTRAINT fk_cliente_idprofissao 
    FOREIGN KEY (idprofissao)
    REFERENCES profissao (idprofissao)
;

SELECT idcliente, profissao, idprofissao FROM cliente;

-- estudante :: 1
SELECT idcliente, profissao FROM cliente WHERE profissao ILIKE 'Est%'; -- 1, 9, 12, 15, 17
UPDATE cliente SET idprofissao = 1 WHERE idcliente IN (1, 9, 12, 15, 17);

-- engenheiro :: 2
SELECT idcliente, profissao FROM cliente WHERE profissao ILIKE 'eng%'; -- 2
UPDATE cliente SET idprofissao = 2 WHERE idcliente = 2;

-- pedreiro :: 3
SELECT idcliente, profissao FROM cliente WHERE profissao ILIKE 'ped%'; -- 3
UPDATE cliente SET idprofissao = 3 WHERE idcliente = 3;

-- jornalista :: 4
SELECT idcliente, profissao FROM cliente WHERE profissao ILIKE 'jor%'; -- 4, 5
UPDATE cliente SET idprofissao = 4 WHERE idcliente IN (4, 5);

-- professor :: 5
SELECT idcliente, profissao FROM cliente WHERE profissao ILIKE 'pr%';
UPDATE cliente SET idprofissao = 5 WHERE idcliente IN (6, 7, 8, 13);

-- drop 
ALTER TABLE cliente DROP profissao;

/*
   7.2. Nacionalidade
*/

SELECT * FROM nacionalidade;
SELECT idcliente, nacionalidade, idnacionalidade FROM cliente;

-- criar campo
ALTER TABLE cliente ADD idnacionalidade INTEGER;

-- referenciar
ALTER TABLE cliente ADD CONSTRAINT fk_cliente_idnacionalidade
    FOREIGN KEY (idnacionalidade) 
    REFERENCES nacionalidade (idnacionalidade)
;

SELECT idcliente, nacionalidade, idnacionalidade FROM cliente;

-- brasileira :: 1
UPDATE cliente SET idnacionalidade = 1 WHERE nacionalidade ILIKE 'br%';

-- italiana :: 2
UPDATE cliente SET idnacionalidade = 2 WHERE nacionalidade ILIKE 'it%';

-- norte americana :: 3
UPDATE cliente SET idnacionalidade = 3 WHERE nacionalidade ILIKE 'norte%';

-- alema :: 4
UPDATE cliente SET idnacionalidade = 4 WHERE nacionalidade ILIKE 'alem%';

-- drop
ALTER TABLE cliente DROP nacionalidade;

-- check
SELECT 
    c.idcliente, 
    c.nome, 
    n.nome
FROM cliente c
JOIN nacionalidade n
    ON c.idnacionalidade = n.idnacionalidade;

/*
    7.3. complemento
*/

SELECT * FROM complemento;

-- criar atributo idcomplemento
ALTER TABLE cliente ADD idcomplemento INTEGER;
-- referenciar
ALTER TABLE cliente ADD CONSTRAINT fk_cliente_idcomplemento
    FOREIGN KEY (idcomplemento)
    REFERENCES complemento (idcomplemento)
;

SELECT idcliente, complemento, idcomplemento FROM cliente;
-- casa :: 1
UPDATE cliente SET idcomplemento = 1 WHERE complemento ILIKE 'ca%';
-- apartamento :: 2
UPDATE cliente SET idcomplemento = 2 WHERE complemento ILIKE 'ap%';
-- check
SELECT
    c.idcliente,
    c.nome,
    com.nome
FROM cliente c
JOIN complemento com
    ON c.idcomplemento = com.idcomplemento;

-- drop
ALTER TABLE cliente DROP complemento;

/*
    7.4.  bairro
*/

-- criar atributo idbairro
ALTER TABLE cliente ADD idbairro INTEGER;
-- referenciar
ALTER TABLE cliente ADD CONSTRAINT fk_cliente_idbairro
    FOREIGN KEY (idbairro)
    REFERENCES bairro (idbairro)
;

SELECT * FROM bairro;
SELECT idcliente, bairro FROM cliente;

-- cdd nova :: 1
UPDATE cliente SET idbairro = 1 WHERE bairro IN ('C. Nova', 'Cidade Nova', 'Cidade N.');
-- centro :: 2
UPDATE cliente SET idbairro = 2 WHERE bairro IN ('Ctr.', 'Cto.', 'Centro');
-- sao pedro :: 3
UPDATE cliente SET idbairro = 3 WHERE bairro ILIKE '%pedro%';
-- santa rosa :: 4
UPDATE cliente SET idbairro = 4 WHERE bairro ILIKE '%rosa%';

-- check
SELECT idcliente, nome, bairro, idbairro from cliente;

-- drop
ALTER TABLE cliente DROP bairro;

SELECT 
    c.nome,
    b.nome
FROM cliente c
JOIN bairro b
    ON c.idbairro = b.idbairro;

/*
    7.5. municipio e uf
*/

-- criar atributo idmunicipio
ALTER TABLE cliente ADD idmunicipio INTEGER;
-- referenciar
ALTER TABLE cliente ADD CONSTRAINT fk_cliente_idmunicipio
    FOREIGN KEY (idmunicipio)
    REFERENCES municipio (idmunicipio)
;
-- 
SELECT idcliente, municipio, idmunicipio FROM cliente;
SELECT idcliente FROM cliente WHERE municipio ILIKE 'união da vitória';

-- porto uniao :: 1
UPDATE cliente SET idmunicipio = 1 WHERE municipio IN ('P. União', 'PU', 'Porto União', 'União');
-- canoinhas :: 2
UPDATE cliente SET idmunicipio = 2 WHERE municipio IN ('Canoinhas');
-- porto vitoria :: 3
UPDATE cliente SET idmunicipio = 3 WHERE municipio IN ('Porto Vitória');
-- general carneiro :: 4
UPDATE cliente SET idmunicipio = 4 WHERE municipio ILIKE 'general carneiro';
-- sao paulo :: 5
UPDATE cliente SET idmunicipio = 5 WHERE municipio ILIKE 'são paulo';
-- rio de janeiro :: 6
UPDATE cliente SET idmunicipio = 6 WHERE municipio ILIKE 'rio de janeiro';
-- uberlandia :: 7
UPDATE cliente SET idmunicipio = 7 WHERE municipio ILIKE 'uberl%';
-- porto alegre :: 8
UPDATE cliente SET idmunicipio = 8 WHERE municipio ILIKE 'porto alegre';
-- uniao da vitoria :: 9
UPDATE cliente SET idmunicipio = 9 WHERE municipio ILIKE 'união da vitória';

-- check
SELECT nome, municipio, idmunicipio FROM cliente;

-- drop
ALTER TABLE cliente DROP municipio;
ALTER TABLE cliente DROP uf;

/*
    nota: registro na tabela cliente com idcliente = 17
        este foi criado com municipio até aqui está null, corrigindo a seguir;
*/

-- insert municipio Curitiba/PR iduf::16
INSERT INTO municipio (idmunicipio, nome, iduf)
VALUES (10, 'Curitiba', 16);
-- update idmunicipio cliente
UPDATE cliente SET idmunicipio = 10 WHERE idcliente = 17;

-- check
SELECT * FROM cliente;