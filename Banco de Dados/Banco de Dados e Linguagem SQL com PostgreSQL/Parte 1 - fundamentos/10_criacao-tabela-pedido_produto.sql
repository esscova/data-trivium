-- TABELA PEDIDO_PRODUTO

/*
    10.1. Crie a tabela pedido_produto, para armazenar os produtos de cada pedido, com:
        - idpedido (chave primária composta, chave estrangeira para pedido)
        - idproduto (chave primária composta, chave estrangeira para produto)
        - quantidade (obrigatória)
        - valor_unitario (obrigatório, numérico)
*/

CREATE TABLE pedido_produto (
    idpedido INTEGER NOT NULL,
    idproduto INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,
    valor_unitario NUMERIC(12,2) NOT NULL,

    CONSTRAINT pk_pedido_produto_idpedido_idproduto 
        PRIMARY KEY (idpedido, idproduto),

    CONSTRAINT fk_pedido_produto_idpedido 
        FOREIGN KEY (idpedido)
        REFERENCES pedido (idpedido),

    CONSTRAINT fk_pedido_produto_idproduto 
        FOREIGN KEY (idproduto) 
        REFERENCES produto (idproduto)
);

/*
    10.2. popular
*/
INSERT INTO 
    pedido_produto
    (idpedido, idproduto, quantidade, valor_unitario)
VALUES
    (1, 1, 1, 800),
    (1, 2, 1, 500),
    (2, 2, 1, 500),
    (3, 4, 2, 150),
    (4, 1, 1, 800),
    (4, 3, 1, 200),
    (5, 3, 1, 200),
    (6, 1, 2, 800),
    (6, 7, 1, 35),
    (6, 5, 1, 200),
    (6, 4, 1, 150),
    (7, 1, 1, 800),
    (8, 7, 5, 35),
    (9, 1, 1, 800),
    (9, 2, 1, 500),
    (10, 5, 1, 200),
    (11, 5, 1, 200),
    (11, 6, 1, 100),
    (12, 2, 1, 500),
    (13, 3, 1, 200),
    (13, 4, 1, 150),
    (14, 6, 3, 100),
    (15, 3, 1, 200)
;

-- check
SELECT * FROM pedido_produto;