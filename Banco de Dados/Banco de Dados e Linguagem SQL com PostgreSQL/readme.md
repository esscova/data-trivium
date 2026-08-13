# Fundamentos de Banco de Dados e SQL

Notas de estudo referentes à Parte 1 do curso [Banco de Dados e Linguagem SQL com PostgreSQL](https://iaexpert.academy/cursos-online-assinatura/banco-de-dados-sql-postgresql/), de Jones Granatyr (IAExpert Academy).

Os scripts são organizados por tema, seguindo a ordem das aulas. Cada exercício é documentado como comentário dentro do arquivo `.sql` correspondente, com o enunciado resumido antes do código.

Ambiente utilizado: `Banco de Dados/ambientes/postgres/`.

## Scripts

| Exercício | Arquivo | Tema |
|---|---|---|
| 01 | `01_criacao-bd.sql` | Criação do banco de dados |

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
