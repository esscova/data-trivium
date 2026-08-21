-- CRIAÇÃO TABELA PEDIDO

/*
    9.1. Crie a tabela pedido, para armazenar os pedidos feitos pelos clientes, com 
        - idpedido (chave primária, obrigatório), 
        - data_pedido (obrigatória) 
        - valor (obrigatório, numérico). 
        - idcliente (obrigatório, chave estrangeira para cliente), 
        - idtransportadora (opcional, chave estrangeira para transportadora), 
        - idvendedor (obrigatório, chave estrangeira para vendedor), 
*/
CREATE TABLE pedido (
    idpedido INTEGER NOT NULL,
    data_pedido DATE NOT NULL,
    valor NUMERIC(12, 2) NOT NULL,
    idcliente INTEGER NOT NULL,
    idtransportadora INTEGER,
    idvendedor INTEGER NOT NULL,

    CONSTRAINT pk_pedido_idpedido 
        PRIMARY KEY (idpedido),
    
    CONSTRAINT fk_pedido_idcliente 
        FOREIGN KEY (idcliente) 
        REFERENCES cliente (idcliente),
    
    CONSTRAINT fk_pedido_idtransportadora 
        FOREIGN KEY (idtransportadora) 
        REFERENCES transportadora (idtransportadora),
    
    CONSTRAINT fk_pedido_idvendedor 
        FOREIGN KEY (idvendedor) 
        REFERENCES vendedor (idvendedor)
);

/*
    9.2. POPULAR
*/
INSERT INTO 
    pedido
    (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
VALUES
    (1,  '2008-04-01', 1300, 1, 1, 1),
    (2,  '2008-04-01', 500,  1, 1, 1),
    (3,  '2008-04-02', 300,  11, 2, 5),
    (4,  '2008-04-05', 1000, 8, 1, 7),
    (5,  '2008-04-06', 200,  9, 2, 6),
    (6,  '2008-04-06', 1985, 10, 1, 6),
    (7,  '2008-04-06', 800,  3, 1, 7),
    (8,  '2008-04-06', 175,  3, NULL, 8),
    (9,  '2008-04-07', 1300, 12, NULL, 8),
    (10, '2008-04-10', 200, 6, 1, 8),
    (11, '2008-04-15', 300, 15, 2, 1),
    (12, '2008-04-20', 500, 15, 2, 5),
    (13, '2008-04-20', 350, 9, 1, 7),
    (14, '2008-04-23', 300, 2, 1, 5),
    (15, '2008-04-25', 200, 11, NULL, 5)
;

-- check
SELECT * FROM pedido;