## 1. Fundamentos do Modelo Relacional

O modelo relacional, proposto por Edgar Codd em 1970, organiza dados em tabelas bidimensionais, onde cada linha representa uma instância e cada coluna representa uma característica dessa instância. Antes de qualquer implementação em SQL, defino aqui os conceitos que sustentam essa organização.

### 1.1 Entidade e Atributo

Uma entidade é algo do mundo real ou abstrato sobre o qual armazeno dados: um cliente, um produto, um pedido. No modelo lógico, cada entidade se transforma em uma tabela.

Um atributo é uma propriedade que descreve a entidade. Um cliente, por exemplo, tem nome, e-mail e data de cadastro como atributos. No modelo lógico, cada atributo se transforma em uma coluna da tabela.

Atributos podem ser classificados como:

- **Simples**: não se dividem em partes menores (idade, CPF).
- **Compostos**: podem ser decompostos em partes menores (endereço, que se divide em rua, número, cidade).
- **Monovalorados**: têm um único valor por instância (data de nascimento).
- **Multivalorados**: podem ter múltiplos valores para a mesma instância (telefones de contato de um cliente).
- **Derivados**: calculados a partir de outros atributos (idade, derivada da data de nascimento).

### 1.2 Relacionamento

Um relacionamento representa uma associação entre duas ou mais entidades. Um cliente realiza um pedido, um pedido contém produtos: cada uma dessas ligações é um relacionamento.

Relacionamentos têm cardinalidade, que expressa quantas instâncias de uma entidade se associam a quantas instâncias de outra:

- **Um para um (1:1)**: uma instância de A se relaciona com no máximo uma instância de B.
- **Um para muitos (1:N)**: uma instância de A se relaciona com várias instâncias de B, mas cada instância de B se relaciona com apenas uma de A.
- **Muitos para muitos (N:N)**: várias instâncias de A se relacionam com várias instâncias de B.

A cardinalidade determina como o relacionamento será implementado no modelo lógico, ponto que retomo na seção 3.

### 1.3 Da Entidade à Tabela: Tupla, Domínio e Esquema

Quando uma entidade se torna tabela, três termos passam a descrever sua estrutura:

- **Esquema**: a definição da tabela, com nome e lista de colunas e seus tipos. É a estrutura, não os dados.
- **Tupla**: cada linha da tabela, correspondente a uma instância da entidade.
- **Domínio**: o conjunto de valores válidos que um atributo pode assumir. O domínio de uma coluna `idade`, por exemplo, é o conjunto de números inteiros não negativos dentro de uma faixa plausível.

Um exemplo concreto ajuda a fixar os três termos juntos. Para uma entidade Cliente, o esquema define as colunas:

| id_cliente | nome | email | data_cadastro |
|---|---|---|---|

Cada linha preenchida é uma tupla:

| id_cliente | nome | email | data_cadastro |
|---|---|---|---|
| 1 | Maria Silva | maria@email.com | 2024-01-15 |

E o domínio de `id_cliente` é o conjunto dos números inteiros positivos, enquanto o domínio de `data_cadastro` é o conjunto de datas válidas no calendário.

Esses três conceitos, esquema, tupla e domínio, formam a base sobre a qual construo as próximas seções: primeiro as chaves que garantem identidade e integridade às tuplas, depois a conversão completa do modelo conceitual em tabelas.

---
