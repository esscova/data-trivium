# Regressão Linear

Implementações progressivas de modelos de regressão linear aplicados a problemas reais de precificação e previsão.

Desenvolvido como material de estudo e portfólio a partir do curso [Data Science: testando relações com Regressão Linear](https://www.alura.com.br/curso-online-data-science-testando-relacoes-regressao-linear) da Alura.

---

## Projetos

### [1. Preços de Imóveis](./preços%20de%20imóveis%20com%20regressão%20linear.ipynb)
Ponto de partida da série. Precificação de imóveis residenciais com construção progressiva de quatro modelos OLS, partindo de um único preditor (área do primeiro andar) até um modelo com quatro variáveis. Inclui análise de correlação, separação treino/teste, diagnóstico de multicolinearidade via VIF e análise de resíduos.

**Dataset:** adaptação do [House Prices, Kaggle](https://www.kaggle.com/competitions/house-prices-advanced-regression-techniques)

### [2. Precificação de Quartos de Hotéis](./precificando%20quartos%20de%20hotéis.ipynb)
Precificação de diárias hoteleiras com análise exploratória via PairPlot da Seaborn. Destaque para a correlação negativa de `ProximidadeTurismo` com o preço e para a construção e comparação de três modelos com inclusão progressiva de variáveis.

**Dataset:** disponibilizado pela Alura

### [3. Usina de Energia](./usina%20de%20energia%20-%20multicolinearidade%20e%20homocedasticidade.ipynb)
Previsão de potência elétrica gerada a partir de variáveis ambientais. Foco em diagnóstico e correção de multicolinearidade via VIF e verificação de homocedasticidade nos resíduos. Comparação entre modelo completo e modelo reduzido após remoção da variável colinear.

**Dataset:** [Combined Cycle Power Plant, UCI ML Repository](https://archive.ics.uci.edu/dataset/294/combined+cycle+power+plant)

---

## Resultados

| Projeto | Variável alvo | Variáveis | R² (teste) |
|---|---|---|---|
| Preços de Imóveis | `preco_de_venda` | 4 | 0,6432 |
| Quartos de Hotéis | `Preco` | 3 | 0,9194 |
| Usina de Energia (completo) | `PE` | 4 | 0,9278 |
| Usina de Energia (reduzido) | `PE` | 3 | 0,9211 |

---

## Stack

| Ferramenta | Uso |
|---|---|
| `pandas` / `numpy` | manipulação e cálculo |
| `matplotlib` / `seaborn` | visualizações estáticas |
| `plotly` | visualizações interativas |
| `statsmodels` | ajuste OLS e diagnósticos |
| `scikit-learn` | separação treino/teste e R² |

---

## Referências

Curso: [Data Science: testando relações com Regressão Linear](https://www.alura.com.br/curso-online-data-science-testando-relacoes-regressao-linear) - Alura

Revisão e auxílio: [Claude](https://claude.ai) - Anthropic