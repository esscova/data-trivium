-- criação de tabela 'cliente' conforme instruções do exercício

CREATE TABLE cliente (
    idcliente INTEGER NOT NULL,
    nome VARCHAR(50) NOT NULL,
    cpf CHAR(11),
    rg VARCHAR(15),
    data_nascimento DATE,
    genero CHAR(1),
    profissao VARCHAR(30),
    nacionalidade VARCHAR(30),
    logradouro VARCHAR(30),
    numero VARCHAR(10),
    complemento VARCHAR(30),
    bairro VARCHAR(30),
    municipio VARCHAR(30),
    uf VARCHAR(30),
    observacoes TEXT,

    CONSTRAINT pk_cln_idcliente PRIMARY KEY (idcliente)
);