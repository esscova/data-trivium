# Ambiente Postgres (Docker)

Ambiente containerizado com Postgres e pgAdmin, criado como template reutilizável para os
projetos de banco de dados reprodutível, sem dependência de instalação nativa
no sistema operacional. O mesmo `docker-compose.yml` pode ser copiado para outros projetos 
que precisem de um Postgres isolado, bastando ajustar o arquivo `.env`.

## Pré-requisitos

- Docker Desktop instalado e em execução (backend WSL2 no Windows)
- Portas `5432` e `8080` livres na máquina, ou ajustadas via `.env`

## Estrutura de arquivos

```
postgres/
├── docker-compose.yml
├── .env.example
├── .env              (não versionado)
└── README.md
```

## Configuração

Antes de subir o ambiente, copie o arquivo de exemplo e ajuste os valores se necessário:

```bash
cp .env.example .env
```

Variáveis disponíveis:

| Variável | Padrão | Descrição |
|---|---|---|
| `POSTGRES_USER` | `postgres` | Usuário de acesso ao banco |
| `POSTGRES_PASSWORD` | `postgres` | Senha do usuário |
| `POSTGRES_DB` | `postgres` | Banco de manutenção padrão |
| `POSTGRES_PORT` | `5432` | Porta exposta do Postgres no host |
| `PGADMIN_EMAIL` | `admin@admin.com` | Login de acesso ao pgAdmin |
| `PGADMIN_PASSWORD` | `admin` | Senha de acesso ao pgAdmin |
| `PGADMIN_PORT` | `8080` | Porta exposta do pgAdmin no host |

O arquivo `.env` real fica fora do controle de versão. Apenas `.env.example`, com valores
de referência, é commitado.

## Como usar

**Subir o ambiente:**

```bash
docker compose up -d
```

**Verificar os containers em execução:**

```bash
docker ps
```

**Parar o ambiente, mantendo os dados:**

```bash
docker compose down
```

**Resetar o ambiente por completo, apagando os dados dos volumes:**

```bash
docker compose down -v
```

## Persistência de dados

O ambiente usa dois volumes nomeados:

| Volume | Serviço | Conteúdo |
|---|---|---|
| `pgdata` | postgres | Dados do banco (tabelas, registros) |
| `pgadmin_data` | pgadmin | Configurações do pgAdmin (servidores registrados, sessão) |

Sem o volume do pgAdmin, `docker compose down` destrói o container e a conexão registrada
com o servidor se perde, exigindo novo cadastro a cada subida do ambiente. Com o volume
mapeado, apenas `docker compose down -v` apaga essas configurações, de forma intencional.

## Conectando o pgAdmin ao Postgres

1. Acesse `http://localhost:8080` (ou a porta definida em `PGADMIN_PORT`)
2. Autentique com `PGADMIN_EMAIL` e `PGADMIN_PASSWORD`
3. Clique com o botão direito em **Servers** e escolha **Register > Server**
4. Na aba **General**, defina um nome de exibição qualquer
5. Na aba **Connection**, preencha:

| Campo | Valor |
|---|---|
| Host name/address | `postgres` |
| Port | `5432` |
| Maintenance database | valor de `POSTGRES_DB` |
| Username | valor de `POSTGRES_USER` |
| Password | valor de `POSTGRES_PASSWORD` |

O host é o nome do serviço (`postgres`), não `localhost`. Os dois containers se comunicam
pela rede padrão criada automaticamente pelo Compose, que resolve os serviços pelo nome
declarado em `services:`.

## Reutilizando este template em outro projeto

1. Copie a pasta `postgres/` inteira para o novo local (ex: `Analise de Dados/ambientes/postgres/`)
2. Copie `.env.example` para `.env` e ajuste as portas, caso já exista outro ambiente
Postgres em execução na máquina
3. Suba com `docker compose up -d`

Como o `container_name` não é fixado no compose, múltiplas instâncias podem coexistir sem
conflito de nome, desde que as portas no `.env` sejam distintas.

## Tecnologias Utilizadas

- Docker e Docker Compose
- Postgres 16 (imagem `postgres:16-alpine`)
- pgAdmin 4 (imagem `dpage/pgadmin4`)

## Autor

**Wellington M. Santos**, Cientista de Dados

[LinkedIn](https://www.linkedin.com/in/wellington-moreira-santos) · [GitHub](https://github.com/esscova) · [Contato](mailto:wsantos08@hotmail.com)

