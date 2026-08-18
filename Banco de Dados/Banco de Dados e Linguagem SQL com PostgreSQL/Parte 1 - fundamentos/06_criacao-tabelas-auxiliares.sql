
--    CRIAR TABELAS AUXILIARES

/*
    6.1. tabela profissao
        - idprofissao (chave primária) e 
        - nome (até 30 caracteres, único). 
        - Insira as profissões já existentes na base de clientes: Estudante, Engenheiro, Pedreiro, Jornalista, Professor.
*/

CREATE TABLE profissao (
    idprofissao INTEGER NOT NULL,
    nome VARCHAR(30) NOT NULL,

    CONSTRAINT pk_profissao_idprofissao PRIMARY KEY (idprofissao),
    CONSTRAINT un_profissao_nome        UNIQUE (nome)
);

INSERT INTO 
    profissao 
    (idprofissao, nome) 
VALUES 
    (1, 'Estudante'),
    (2, 'Engenheiro'),
    (3, 'Pedreiro'),
    (4, 'Jornalista'),
    (5, 'Professor')
;

/*
    6.2. tabela nacionalidade
        - com a mesma estrutura de profissao. 
        - Insira as nacionalidades já existentes: Brasileira, Italiana, Norte-americana, Alemã.
*/

CREATE TABLE nacionalidade (
    idnacionalidade INTEGER NOT NULL,
    nome VARCHAR(30) NOT NULL,

    CONSTRAINT pk_nacionalidade_idnacionalidade PRIMARY KEY (idnacionalidade),
    CONSTRAINT un_nacionalidade_nome            UNIQUE(nome)
);

INSERT INTO 
    nacionalidade
    (idnacionalidade, nome)
VALUES
    (1, 'Brasileira'),
    (2, 'Italiana'),
    (3, 'Norte-americana'),
    (4, 'Alemã')
;

/*
    6.3. tabela complemento, 
        - com a mesma estrutura. 
        - Insira: Casa, Apartamento.
*/

CREATE TABLE complemento (
    idcomplemento INTEGER NOT NULL,
    nome VARCHAR(30) NOT NULL,

    CONSTRAINT pk_complemento_idcomplemento PRIMARY KEY (idcomplemento),
    CONSTRAINT un_complemento_nome          UNIQUE (nome)
);

INSERT INTO
    complemento
    (idcomplemento, nome)
VALUES
    (1, 'Casa'),
    (2, 'Apartamento')
;

/*
    6.4. tabela bairro
        - com a mesma estrutura. 
        - Insira: Cidade Nova, Centro, São Pedro, Santa Rosa.
*/

CREATE TABLE bairro (
    idbairro INTEGER NOT NULL,
    nome VARCHAR(30) NOT NULL,

    CONSTRAINT pk_bairro_idbairro PRIMARY KEY (idbairro),
    CONSTRAINT un_bairro_nome UNIQUE (nome)
);

INSERT INTO
    bairro
    (idbairro, nome)
VALUES
    (1, 'Cidade Nova'),
    (2, 'Centro'), 
    (3, 'São Pedro'),
    (4, 'Santa Rosa')
;

/*
    6.5. tabela uf, 
        - com iduf (chave primária), 
        - nome (até 30 caracteres, único) 
        - e sigla (2 caracteres fixos, única). 
        - Insira as unidades de federação já existentes na base de clientes.
*/

CREATE TABLE uf (
    iduf INTEGER NOT NULL,
    nome VARCHAR(30) NOT NULL,
    sigla CHAR(2) NOT NULL,

    CONSTRAINT pk_uf_iduf   PRIMARY KEY (iduf),
    CONSTRAINT un_uf_nome   UNIQUE (nome),
    CONSTRAINT un_uf_sigla  UNIQUE (sigla)
);

INSERT INTO
    uf
    (iduf, nome, sigla)
VALUES
    (1,  'Acre',                'AC'),
    (2,  'Alagoas',             'AL'),
    (3,  'Amapá',               'AP'),
    (4,  'Amazonas',            'AM'),
    (5,  'Bahia',               'BA'),
    (6,  'Ceará',               'CE'),
    (7,  'Distrito Federal',    'DF'),
    (8,  'Espírito Santo',      'ES'),
    (9,  'Goiás',               'GO'),
    (10, 'Maranhão',            'MA'),
    (11, 'Mato Grosso',         'MT'),
    (12, 'Mato Grosso do Sul',  'MS'),
    (13, 'Minas Gerais',        'MG'),
    (14, 'Pará',                'PA'),
    (15, 'Paraíba',             'PB'),
    (16, 'Paraná',              'PR'),
    (17, 'Pernambuco',          'PE'),
    (18, 'Piauí',               'PI'),
    (19, 'Rio de Janeiro',      'RJ'),
    (20, 'Rio Grande do Norte', 'RN'),
    (21, 'Rio Grande do Sul',   'RS'),
    (22, 'Rondônia',            'RO'),
    (23, 'Roraima',             'RR'),
    (24, 'Santa Catarina',      'SC'),
    (25, 'São Paulo',           'SP'),
    (26, 'Sergipe',             'SE'),
    (27, 'Tocantins',           'TO')
;
-- nota: optei por inserir todos os estados

/*
    6.6. tabela municipio,
        - com idmunicipio (chave primária),
        - nome (até 30 caracteres, único) 
        - iduf (obrigatório, chave estrangeira para uf). 
        - Insira os municípios já existentes na base de clientes.
*/

CREATE TABLE municipio (
    idmunicipio INTEGER NOT NULL,
    nome  VARCHAR(30) NOT NULL,
    iduf INTEGER NOT NULL,

    CONSTRAINT pk_municipio_idmunicipio PRIMARY KEY (idmunicipio),
    CONSTRAINT un_municipio_nome        UNIQUE (nome),
    CONSTRAINT fk_municipio_iduf        
        FOREIGN KEY (iduf) 
        REFERENCES uf (iduf)
);

-- SELECT DISTINCT(municipio) FROM cliente;
-- SELECT iduf, sigla FROM uf;

INSERT INTO
    municipio 
    (idmunicipio, nome, iduf)
VALUES
    (1, 'Porto União', 24),
    (2, 'Canoinhas', 24),
    (3, 'Porto Vitória', 16),
    (4, 'General Carneiro', 16),
    (5, 'São Paulo', 25),
    (6, 'Rio de Janeiro', 19),
    (7, 'Uberlândia', 13),
    (8, 'Porto Alegre', 21),
    (9, 'União da Vitória', 16)
;