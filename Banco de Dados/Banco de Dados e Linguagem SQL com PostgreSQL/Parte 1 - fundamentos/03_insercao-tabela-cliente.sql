-- exercicio 03: popular tabela cliente

INSERT INTO 
    cliente 
    (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf) 
VALUES
    (1, 'Manoel', '88828383821', '32323', '2001-10-10', 'M', 'Estudante', 'Brasileira', 'Rua Joaquim Nabuco', '23', 'Casa', 'Cidade Nova', 'União', 'SC'),
    (2, 'Geraldo', '12343299291', '56565', '1987-01-04', 'M', 'Engenheiro', 'Brasileira', 'Rua das Limas', '200', 'Ap.', 'Centro', 'P. União', 'SC'),
    (3, 'Carlos', '87732323227', '55463', '1967-10-01', 'M', 'Pedreiro', 'Brasileira', 'Rua das Laranjeiras', '300', 'Apart.', 'Cto.', 'Canoinhas', 'SC'),  
    (4, 'Adriana', '12321222122', '98777', '1989-09-10', 'F', 'Jornalista', 'Brasileira', 'Rua das Limas', '240', NULL, 'São Pedro', 'Porto Vitória', 'PR'),
    (5, 'Amanda', '99928238828', '28382', '1991-03-04', 'F', 'Jorn.', 'Italiana', 'Av. Central', '100', NULL, 'São Pedro', 'General Carneiro', 'SC'),
    (6, 'Ângelo', '99928218', '12323', '2000-01-01', NULL, 'Professor', 'Brasileiro', 'Av. Beira Mar', '300', NULL, 'Ctr.', 'São Paulo', 'SP'),
    (7, 'Anderson', NULL, NULL, NULL, 'M', 'Prof.', 'Italiano', 'Av. Brasil', '100', 'Apartamento', 'Santa Rosa', 'Rio de Janeiro', 'SP'),
    (8, 'Camila', '9998228828', NULL, '2001-10-10', 'F', 'Professora', 'Norte americana', 'Rua Central', '4333', NULL, 'Centro', 'Uberlância', 'MG'),
    (9, 'Cristiano', NULL, NULL, NULL, 'M', 'Estudante', 'Alemã', 'Rua do Centro', '877', 'Casa', 'Centro', 'Porto Alegre', 'RS'),
    (10, 'Fabrício', '8828282828', '32323', NULL, NULL, NULL, 'Brasileiro', NULL, NULL, NULL, NULL, 'PU', 'SC'),
    (11, 'Fernanda', NULL, NULL, NULL, NULL, NULL,'Brasileira', NULL, NULL, NULL, NULL, 'Porto União', 'SC'),
    (12, 'Gilmar', '88881818181', '888', '2000-02-10', 'M', 'Estud.', 'Brasileira', 'Rua das Laranjeiras', '200', NULL, 'C. Nova', 'Canoinhas', 'SC'),
    (13, 'Diego', '1010191919', '111939', NULL, 'M', 'Professor', 'Alemão', 'Rua Central', '455', 'Casa', 'Cidade N.', 'São Paulo', 'SP'),
    (14, 'Jeferson', NULL, NULL, '1983-07-01', 'M', NULL, 'Brasileiro', NULL, NULL, NULL, NULL, 'União da Vitória', 'PR' ),
    (15, 'Jessica', NULL, NULL, NULL, 'F', 'Estudante', NULL, NULL, NULL, NULL, NULL, 'União da Vitória', 'PR')
;