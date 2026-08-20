-- CRIAÇÃO TABELAS COMERCIAIS

/*
    8.1. Crie a tabela fornecedor
        - com idfornecedor (chave primária) e 
        - nome (até 50 caracteres, único). 
        - Insira os fornecedores.
*/
-- criar
CREATE TABLE fornecedor (
    idfornecedor INTEGER NOT NULL,
    nome VARCHAR (50) NOT NULL,

    CONSTRAINT pk_fornecedor_idfornecedor 
        PRIMARY KEY (idfornecedor),
    CONSTRAINT un_fornecedor_nome
        UNIQUE (nome)
);

-- popular
INSERT INTO fornecedor 
    (idfornecedor, nome)
VALUES
    (1, 'Cap. Computadores'),
    (2, 'AA. Computadores'),
    (3, 'BB Máquinas')
;
-- check
SELECT * FROM fornecedor;

/*
    8.2. Crie a tabela vendedor, com 
        - idvendedor (chave primária) e 
        - nome (até 50 caracteres, único). 
        - Insira os vendedores.
*/

-- criar 
CREATE TABLE vendedor (
    idvendedor INTEGER NOT NULL,
    nome VARCHAR (50) NOT NULL,

    CONSTRAINT pk_vendedor_idvendedor 
        PRIMARY KEY (idvendedor)
    CONSTRAINT un_vendedor_nome
        UNIQUE (nome)
);

-- inserir
INSERT INTO vendedor
    (idvendedor, nome)
VALUES
    (1, 'André'),
    (2, 'Alisson'),
    (3, 'José'),
    (4, 'Ailton'),
    (5, 'Maria'),
    (6, 'Suelem'),
    (7, 'Aline'),
    (8, 'Silvana')
;

-- check
SELECT * FROM vendedor;

/*
    8.3. Crie a tabela transportadora, com 
        - idtransportadora (chave primária), 
        - idmunicipio (opcional, chave estrangeira para municipio), 
        - nome (até 50 caracteres, único), 
        - logradouro (até 50 caracteres, opcional) e 
        - numero (até 10 caracteres, opcional). 
        - Insira as transportadoras.
*/

-- criar
CREATE TABLE transportadora (
    idtransportadora INTEGER NOT NULL,
    nome VARCHAR (50) NOT NULL,
    idmunicipio INTEGER,
    logradouro VARCHAR(50),
    numero VARCHAR(10),

    CONSTRAINT pk_transportadora_idtransportadora
        PRIMARY KEY (idtransportadora),
    CONSTRAINT fk_transportadora_idmunicipio
        FOREIGN KEY (idmunicipio)
        REFERENCES municipio (idmunicipio),
    CONSTRAINT un_transportadora_nome
        UNIQUE (nome)
);

-- insert
INSERT INTO 
    transportadora
    (idtransportadora, nome, idmunicipio, logradouro, numero)
VALUES
    (1, 'BS. Transportes', 9,'Rua das Limas', '01'),
    (2, 'União Transportes', 5, NULL, NULL)
;
-- check
SELECT * FROM transportadora;

/*
    8.4. Crie a tabela produto, com 
        - idproduto (chave primária), 
        - idfornecedor (obrigatório, chave estrangeira para fornecedor), 
        - nome (até 50 caracteres) e 
        - valor (obrigatório, numérico). 
        - Insira os produtos.
*/
-- criar
CREATE TABLE produto (
    idproduto INTEGER NOT NULL,
    idfornecedor INTEGER NOT NULL,
    nome VARCHAR(50) NOT NULL,
    valor NUMERIC(12,2) NOT NULL,
    -- NUMERIC como tipo de dado para o campo valor para evitar
    -- arredondamento de ponto flutuante em valores monetarios.

    CONSTRAINT pk_produto_idproduto
        PRIMARY KEY (idproduto),
    CONSTRAINT fk_produto_idfornecedor
        FOREIGN KEY (idfornecedor)
        REFERENCES fornecedor (idfornecedor)
);

-- popular
INSERT INTO 
    produto
    (idproduto, idfornecedor, nome, valor)
VALUES
    (1, 1, 'Microcomputador', 800),
    (2, 1, 'Monitor', 500),
    (3, 2, 'Placa mãe', 200),
    (4, 2, 'HD', 150),
    (5, 2, 'Placa de vídeo', 200),
    (6, 3, 'Memória RAM', 100),
    (7, 1, 'Gabinete', 35)
;

-- check
SELECT * FROM produto;