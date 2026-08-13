# Como Criar um Banco de Dados Relacional

Nota de referência sobre os métodos disponíveis para criação de um banco de dados relacional com foco no SGBD PostgreSQL.

A criação do banco é o ponto de partida físico para organizar qualquer conjunto de dados. O comando de criação pertence ao subconjunto DDL (Data Definition Language) da linguagem SQL, dedicado a definir e alterar a estrutura dos objetos do banco.

Existem três formas principais de criar um banco: por comando SQL, por interface gráfica e por linha de comando.

---

## 1. Criando por comando SQL

### Sintaxe básica

Praticamente todos os SGBDs relacionais aceitam a instrução padrão:

```sql
CREATE DATABASE nome_do_banco;
```

### Sintaxe estendida no PostgreSQL

O PostgreSQL permite detalhar codificação, localidade e template de origem na criação:

```sql
CREATE DATABASE nome_do_banco
    WITH
    OWNER = usuario
    ENCODING = 'UTF8'
    LC_COLLATE = 'pt_BR.UTF-8'
    LC_CTYPE = 'pt_BR.UTF-8'
    TEMPLATE = template0;
```

**Parâmetros:**

- `OWNER`: papel (role) dono do banco, responsável pelas permissões padrão.
- `ENCODING`: codificação de caracteres do banco, UTF8 evita problemas com acentuação.
- `LC_COLLATE` e `LC_CTYPE`: regras de ordenação e classificação de caracteres, fixadas na criação e não alteráveis depois.
- `TEMPLATE`: banco usado como modelo. `template0` garante um banco limpo, sem objetos adicionais herdados de `template1`.

**Atenção com nomes em camelCase**: nomes de banco com letras maiúsculas misturadas (`meuBanco`) exigem aspas duplas em toda referência futura (`"meuBanco"`), porque o PostgreSQL converte identificadores sem aspas para minúsculo automaticamente. Prefiro sempre `snake_case` ou minúsculo para evitar esse problema de quoting.

---

## 2. Criando por interface gráfica (pgAdmin)

Passos:

1. Conectar ao servidor no pgAdmin.
2. No painel esquerdo, clicar com o botão direito em **Databases**.
3. Selecionar **Create** > **Database...**.
4. Preencher o nome do banco na aba **General** e o owner, se necessário.
5. Ajustar encoding e template na aba **Definition**, quando o padrão não servir.
6. Clicar em **Save**.

---

## 3. Criando por linha de comando (terminal)

O PostgreSQL expõe o utilitário `createdb`, que encapsula um `CREATE DATABASE` internamente:

```bash
createdb nome_do_banco
```

Sem argumento de nome, o comando cria um banco com o mesmo nome do usuário do sistema operacional atual. Falha de permissão indica que o role não tem privilégio de criação de banco.

### Dentro de um container Docker

Quando o banco roda em container, o comando precisa ser executado dentro dele:

```bash
docker exec -it nome_do_container createdb -U usuario nome_do_banco
```

Ou entrando primeiro no `psql` interativo:

```bash
docker exec -it nome_do_container psql -U usuario
```

E, dentro do prompt `postgres=#`, executar o `CREATE DATABASE` do método 1.

---

## 4. Operações pós-criação

### Listar bancos existentes

No `psql`, dentro do container ou local:

```
\l
```

Ou por SQL puro, consultando o catálogo:

```sql
SELECT datname FROM pg_database;
```

### Selecionar o banco de trabalho

No `psql`, a troca de banco é feita por:

```
\c nome_do_banco
```

Fora do `psql`, a seleção do banco acontece na própria string de conexão. Não existe comando `USE` no PostgreSQL.

### Excluir um banco (DROP DATABASE)

Operação irreversível, apaga fisicamente todos os dados:

```sql
DROP DATABASE nome_do_banco;
```

O PostgreSQL recusa a exclusão se houver alguma sessão conectada ao banco. Para forçar o encerramento das conexões antes de derrubar o banco:

```sql
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'nome_do_banco'
AND pid <> pg_backend_pid();

DROP DATABASE nome_do_banco;
```

---

## Referências

* Documentação oficial do PostgreSQL, comando CREATE DATABASE: https://www.postgresql.org/docs/current/sql-createdatabase.html
* Documentação oficial do PostgreSQL, comando DROP DATABASE: https://www.postgresql.org/docs/current/sql-dropdatabase.html
* Curso Banco de Dados e Linguagem SQL com PostgreSQL, Jones Granatyr, IAExpert Academy.