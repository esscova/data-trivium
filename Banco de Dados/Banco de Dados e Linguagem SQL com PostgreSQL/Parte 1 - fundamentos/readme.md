# Fundamentos de Banco de Dados e SQL

Notas de estudo referentes à Parte 1 do curso [Banco de Dados e Linguagem SQL com PostgreSQL](https://iaexpert.academy/cursos-online-assinatura/banco-de-dados-sql-postgresql/), de Jones Granatyr (IAExpert Academy).

Os scripts são organizados por tema, seguindo a ordem das aulas. Cada exercício é documentado como comentário dentro do arquivo `.sql` correspondente, com o enunciado resumido antes do código.

Ambiente utilizado: `Banco de Dados/ambientes/postgres/`.

## Scripts

| Exercício | Arquivo | Tema |
|---|---|---|
| 01 | `01_criacao-bd.sql` | Criação do banco de dados |
| 02 | `02_criacao-tabela-cliente.sql` | Criação da tabela cliente |
| 03 | `03_insercao-tabela-cliente.sql` | Inserção de dados |

## Exercícios

### 01. Criar um banco de dados chamado `pedido`.
 No curso, o comando é gerado pelo assistente gráfico do pgAdmin, que preenche `OWNER`, `ENCODING`, `CONNECTION LIMIT` e `IS_TEMPLATE`. Os dois últimos já são os valores padrão do Postgres, então deixei de fora do script. Tornei `TEMPLATE = template0` explícito, boa prática ao especificar encoding manualmente, já que `template1` pode ter sido alterado desde a inicialização do cluster.

### 02. Criar tabela `cliente`

Crie a tabela `cliente` para armazenar os dados dos clientes, com os seguintes atributos:

- `idcliente`: identificador único, chave primária, sem autoincremento (inserção manual do ID)
- `nome`: obrigatório, até 50 caracteres, tamanho variável
- `cpf`: 11 caracteres fixos
- `rg`: até 15 caracteres
- `data_nascimento`: data
- `genero`: 1 caractere fixo
- `profissao`: até 30 caracteres
- `nacionalidade`: até 30 caracteres
- `logradouro`, `numero`, `complemento`, `bairro`, `municipio`, `uf`: dados de endereço, até 30 caracteres (`numero` até 10)
- `observacoes`: texto livre, sem limite de tamanho

**Nota (varchar x char)**: `nome` usa tamanho variável e `cpf` usa tamanho fixo de propósito, para ilustrar a diferença entre os dois tipos. `varchar` armazena só o comprimento real do dado, `char` sempre preenche até o tamanho definido (padding com espaço). CPF tem tamanho fixo (11 dígitos), por isso `char` é adequado, nome tem tamanho variável, por isso `varchar`.

### 03. Popular a tabela `cliente`

Insira os 15 clientes abaixo na tabela `cliente`. Campos em branco representam dados não
informados (`NULL`).

| IdCliente | Nome | CPF | RG | Data Nasc. | Gênero | Profissão | Nacionalidade | Logradouro | Número | Complemento | Bairro | Município | UF |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Manoel | 88828383821 | 32323 | 10/10/2001 | M | Estudante | Brasileira | Rua Joaquim Nabuco | 23 | Casa | Cidade Nova | União | SC |
| 2 | Geraldo | 12343299291 | 56565 | 04/01/1987 | M | Engenheiro | Brasileira | Rua das Limas | 200 | Ap. | Centro | P. União | SC |
| 3 | Carlos | 87732323227 | 55463 | 01/10/1967 | M | Pedreiro | Brasileira | Rua das Laranjeiras | 300 | Apart. | Cto. | Canoinhas | SC |
| 4 | Adriana | 12321222122 | 98777 | 10/09/1989 | F | Jornalista | Brasileira | Rua das Limas | 240 | | São Pedro | Porto Vitória | PR |
| 5 | Amanda | 99928238828 | 28382 | 04/03/1991 | F | Jorn. | Italiana | Av. Central | 100 | | São Pedro | General Carneiro | SC |
| 6 | Ângelo | 99928218 | 12323 | 01/01/2000 | | Professor | Brasileiro | Av. Beira Mar | 300 | | Ctr. | São Paulo | SP |
| 7 | Anderson | | | | M | Prof. | Italiano | Av. Brasil | 100 | Apartamento | Santa Rosa | Rio de Janeiro | SP |
| 8 | Camila | 9998228828 | | 10/10/2001 | F | Professora | Norte americana | Rua Central | 4333 | | Centro | Uberlância | MG |
| 9 | Cristiano | | | | M | Estudante | Alemã | Rua do Centro | 877 | Casa | Centro | Porto Alegre | RS |
| 10 | Fabrício | 8828282828 | 32323 | | | | Brasileiro | | | | | PU | SC |
| 11 | Fernanda | | | | | | Brasileira | | | | | Porto União | SC |
| 12 | Gilmar | 88881818181 | 888 | 10/02/2000 | M | Estud. | Brasileira | Rua das Laranjeiras | 200 | | C. Nova | Canoinhas | SC |
| 13 | Diego | 1010191919 | 111939 | | M | Professor | Alemão | Rua Central | 455 | Casa | Cidade N. | São Paulo | SP |
| 14 | Jeferson | | | 01/07/1983 | M | | Brasileiro | | | | | União da Vitória | PR |
| 15 | Jessica | | | | F | Estudante | | | | | | União da Vitória | PR |

**Nota (datas)**: as datas usam formato brasileiro (dd/mm/aaaa) na tabela acima, no script SQL são convertidas para o formato ISO (`aaaa-mm-dd`), padrão aceito pelo Postgres sem depender de locale de sessão.

**Nota**: inconsistências e variações em dados são propositais pois buscam simular errors reais de digitação de usuário.

### 04. Consultas simples

Faça consultas na tabela `cliente`.

4.1. O nome, o gênero e a profissão de todos os clientes, ordenado pelo nome em ordem decrescente

4.2. Os clientes que tenham a letra “R” no nome

4.3. Os clientes que o nome inicia com a letra “C”

4.4. Os clientes que o nome termina com a letra “A”

4.5. Os clientes que moram no bairro “Centro”

4.6. Os clientes que moram em complementos que iniciam com a letra “A”

4.7. Somente os clientes do sexo feminino

4.8. Os clientes que não informaram o CPF

4.9. O nome e a profissão dos clientes, ordenado em ordem crescente pelo nome da profissão

4.10. Os clientes de nacionalidade “Brasileira”

4.11. Os clientes que informaram o número da residência

4.12. Os clientes que moram em Santa Catarina

4.13. Os clientes que nasceram entre 01/01/2000 e 01/01/2002

4.14. O nome do cliente e o logradouro, número, complemento, bairro, município e UF concatenado de todos os clientes
