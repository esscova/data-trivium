## 2. Chaves e Integridade

As chaves são os mecanismos que garantem que cada tupla seja identificável de forma única e que os relacionamentos entre tabelas permaneçam consistentes. Sem elas, o modelo relacional perde a capacidade de referenciar dados com precisão.

### 2.1 Super Chave e Chave Candidata

Uma super chave é qualquer conjunto de atributos capaz de identificar uma tupla de forma única dentro de uma tabela. Na tabela Cliente da seção anterior, o conjunto `{id_cliente}` é uma super chave, assim como `{id_cliente, nome}` ou `{id_cliente, email}`, já que todos incluem um atributo que sozinho já garante unicidade.

Uma chave candidata é uma super chave mínima, ou seja, nenhum atributo pode ser removido dela sem perder a propriedade de unicidade. Em Cliente, `{id_cliente}` é candidata, e `{email}` também pode ser, se eu garantir que nenhum cliente se cadastre com e-mail duplicado. Já `{id_cliente, nome}` não é candidata, porque `{id_cliente}` sozinho já basta.

### 2.2 Chave Primária e Chave Alternativa

Entre as chaves candidatas, escolho uma para ser a chave primária da tabela. Ela identifica cada tupla de forma única e não aceita valores nulos. As demais chaves candidatas que não foram escolhidas se tornam chaves alternativas, e ainda podem receber restrições de unicidade mesmo sem serem a chave primária.

Na tabela Cliente, defino `id_cliente` como chave primária, mesmo com `email` também sendo candidata, porque um identificador numérico autoincrementado é mais estável do que um atributo que o próprio usuário pode alterar.

### 2.3 Chave Estrangeira

Uma chave estrangeira é um atributo, ou conjunto de atributos, em uma tabela que referencia a chave primária de outra tabela. É o mecanismo que implementa relacionamentos entre entidades no modelo lógico, como descrito na seção 1.2.

Retomando o exemplo de Cliente e Pedido, a tabela Pedido armazena `id_cliente` como chave estrangeira, apontando para a chave primária da tabela Cliente:

**Cliente**

| id_cliente (PK) | nome | email |
|---|---|---|
| 1 | Maria Silva | maria@email.com |

**Pedido**

| id_pedido (PK) | data_pedido | id_cliente (FK) |
|---|---|---|
| 101 | 2024-02-10 | 1 |

Essa referência é o que permite que um pedido exista vinculado a um cliente específico, implementando o relacionamento 1:N entre as duas entidades.

### 2.4 Integridade de Dados

Três tipos de integridade sustentam a confiabilidade dos dados em um banco relacional:

- **Integridade de entidade**: garante que toda tabela tenha uma chave primária e que essa chave nunca seja nula. Sem isso, não haveria como distinguir uma tupla de outra com certeza.
- **Integridade referencial**: garante que toda chave estrangeira aponte para um valor existente na tabela referenciada, ou seja nula quando o relacionamento é opcional. Um `id_cliente` em Pedido nunca pode referenciar um cliente inexistente.
- **Integridade de domínio**: garante que cada atributo receba apenas valores compatíveis com seu domínio, como impedir que `data_pedido` receba uma string de texto livre em vez de uma data válida.

Essas três garantias são o que, na prática, o PostgreSQL implementa através de constraints como `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL` e `CHECK`, comandos que detalho na seção 6.

---