# Comparativo de Classificadores com Validação Cruzada e Balanceamento

Comparação de sete algoritmos de classificação na predição de renda anual acima de 50 mil dólares, usando validação cruzada estratificada e balanceamento de classes aplicado corretamente dentro do pipeline, sobre o dataset Adult Census Income.

## Objetivo

Este projeto investiga se o desbalanceamento da classe de interesse (`>50K`, cerca de 24% dos registros) explica o recall limitado observado em classificadores treinados sem qualquer tratamento. Em vez de aplicar balanceamento em um único modelo, comparo sete classificadores com validação cruzada estratificada, primeiro sem tratamento e depois com balanceamento aplicado dentro do próprio pipeline de validação, evitando o vazamento de dados que ocorre quando a reamostragem acontece antes da divisão treino/teste. O ganho observado é validado estatisticamente com o teste de Wilcoxon pareado por fold, em vez de aceito apenas pela diferença de médias. Esse desenho, sete modelos, balanceamento sem vazamento e teste de significância formal sobre o ganho, é o que diferencia o projeto de um exercício de aplicação direta de SMOTE.

## Sobre o Dataset

[Adult Census Income](https://archive.ics.uci.edu/dataset/2/adult), UCI Machine Learning Repository. 32.561 registros e 15 atributos originais, censo populacional dos Estados Unidos de 1994, com atributos demográficos e ocupacionais (idade, escolaridade, estado civil, ocupação, horas trabalhadas por semana, entre outros) e alvo binário indicando renda anual acima ou abaixo de 50 mil dólares. Após tratamento de colunas não informativas e valores ausentes disfarçados, o dataset final usado na modelagem tem 31.978 registros e 12 atributos.

## Metodologia

1. **Tratamento de dados**: remoção da coluna `Fnlwgt` (peso amostral do Census Bureau, sem relação com o indivíduo) e da coluna `Education` (redundante com `Education-Num`), tratamento de valores ausentes disfarçados como `?` em `Workclass` e `Occupation`, remoção de registros com `Native-Country` ausente.
2. **Preparação para o modelo**: `ColumnTransformer` aplicando `StandardScaler` apenas nas colunas numéricas contínuas e `OneHotEncoder` apenas nas categóricas, evitando o escalonamento redundante de colunas já binarizadas.
3. **Validação cruzada estratificada**: `StratifiedKFold` com 10 folds, garantindo proporção de classes preservada em cada divisão.
4. **Treinamento base**: sete classificadores (Naive Bayes, Árvore de Decisão, Random Forest, KNN, Regressão Logística, SVM e MLP) avaliados por recall, precisão, F1 e acurácia, sem qualquer tratamento de desbalanceamento.
5. **Investigação de resultado anômalo**: análise do desempenho do Naive Bayes, cuja suposição de normalidade é violada por um espaço de atributos majoritariamente binário após o one-hot encoding.
6. **Balanceamento dentro do pipeline**: `SMOTETomek` aplicado via `ImbPipeline`, garantindo que a reamostragem ocorra apenas nos dados de treino de cada fold, sem vazamento para o fold de teste.
7. **Teste de significância estatística**: teste de Wilcoxon pareado, comparando o recall de cada modelo nos mesmos 10 folds, com e sem balanceamento.
8. **Avaliação final**: curvas de precisão-recall e matrizes de confusão comparando o melhor modelo (selecionado por F1) nos dois cenários, sobre uma divisão treino/teste independente da validação cruzada.

## Principais Resultados

| Métrica | Sem balanceamento | Com balanceamento |
|---|---|---|
| Melhor modelo (por F1) | Regressão Logística | Regressão Logística |
| Recall médio, classe `>50K` (validação cruzada) | 0,604 | 0,848 |
| F1 médio (validação cruzada) | 0,662 | 0,684 |
| p-valor (Wilcoxon, Regressão Logística) | — | 0,001953 |

### Recall por Modelo, Antes e Depois do Balanceamento

| Modelo | Recall sem balanceamento | Recall com balanceamento | Ganho | p-valor (Wilcoxon) |
|---|---|---|---|---|
| SVM | 0,598 | 0,862 | +0,263 | 0,001953 |
| Regressão Logística | 0,604 | 0,848 | +0,244 | 0,001953 |
| KNN | 0,565 | 0,796 | +0,231 | 0,001953 |
| MLP | 0,605 | 0,745 | +0,140 | 0,001953 |
| Random Forest | 0,623 | 0,689 | +0,067 | 0,001953 |
| Árvore de Decisão | 0,616 | 0,638 | +0,022 | 0,009766 |
| Naive Bayes | 0,956 | 0,943 | -0,013 | 0,001953 |

O ganho de recall é estatisticamente significativo em todos os sete modelos, mas o Naive Bayes é o único caso de queda: seu recall alto sem balanceamento é sintoma da violação da suposição gaussiana, não qualidade preditiva real, o que a precisão de apenas 0,341 e a Average Precision de 0,36 confirmam.

## Tecnologias Utilizadas

- Python
- pandas, numpy
- scikit-learn (`Pipeline`, `ColumnTransformer`, `StratifiedKFold`, `cross_validate`, `GaussianNB`, `DecisionTreeClassifier`, `RandomForestClassifier`, `KNeighborsClassifier`, `LogisticRegression`, `SVC`, `MLPClassifier`)
- imbalanced-learn (`SMOTETomek`, `ImbPipeline`)
- scipy (`stats.wilcoxon`)
- seaborn, matplotlib, plotly
- session_info

## Referências

* Dataset [Adult Census Income](https://archive.ics.uci.edu/dataset/2/adult), UCI Machine Learning Repository.
* Documentação do [scikit-learn](https://scikit-learn.org/stable/), [imbalanced-learn](https://imbalanced-learn.org/stable/) e [scipy.stats.wilcoxon](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.wilcoxon.html).

## Autor

**Wellington M. Santos**, Cientista de Dados

[LinkedIn](https://www.linkedin.com/in/wellington-moreira-santos) · [GitHub](https://github.com/esscova) · [Contato](mailto:wsantos08@hotmail.com)

---

> Material desenvolvido de forma autoral, a partir do dataset Adult Census Income
> (UCI Machine Learning Repository), para o repositório
> [data-trivium](https://github.com/esscova/data-trivium);
> com auxílio do Claude Anthropic para revisões e estruturação.