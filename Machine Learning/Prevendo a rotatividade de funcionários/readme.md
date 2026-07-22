# Previsão de Rotatividade de Funcionários (Attrition)

Previsão de rotatividade (attrition) de funcionários a partir de dados de perfil e uso do RH, comparando quatro modelos de classificação com tratamento explícito de desbalanceamento de classes.

## Objetivo

Este projeto prevê quais funcionários têm maior probabilidade de deixar a empresa, a partir de atributos demográficos, de cargo e de histórico de carreira, para apoiar ações de retenção antes da saída efetiva. O foco não é apenas treinar um classificador, é tratar corretamente o desbalanceamento entre quem sai e quem permanece, comparar modelos de forma robusta e interpretar quais fatores de risco se confirmam entre diferentes algoritmos.

## Sobre o Dataset

[IBM HR Analytics Employee Attrition & Performance](https://www.kaggle.com/pavansubhasht/ibm-hr-analytics-attrition-dataset), Kaggle. Reúne 1470 funcionários com 35 atributos de perfil, cargo, remuneração e histórico de carreira, incluindo a variável alvo `Attrition`, com 16,12% de casos de saída.

## Metodologia

1. **Inspeção e limpeza**: remoção de colunas constantes e identificadoras (`EmployeeCount`, `StandardHours`, `Over18`, `EmployeeNumber`), codificação binária de `Attrition` e `OverTime`.
2. **Análise exploratória**: correlação das variáveis com o alvo, multicolinearidade entre atributos numéricos, perfis comportamentais por categoria e confirmação do desbalanceamento de classes.
3. **Preparação**: codificação one-hot com `drop='first'` para evitar armadilha de variável dummy, padronização com `MinMaxScaler`, divisão treino/teste estratificada com semente fixa para reprodutibilidade.
4. **Tratamento do desbalanceamento**: cada modelo treinado em versão base e em versão balanceada (`class_weight` balanceado na regressão logística e no random forest, `scale_pos_weight` no XGBoost, pesos de classe manuais na rede neural).
5. **Treinamento**: quatro modelos, regressão logística, random forest, XGBoost e rede neural artificial.
6. **Validação**: validação cruzada estratificada de 5 folds, curvas ROC e Precisão-Recall, matrizes de confusão padronizadas entre os quatro modelos.
7. **Interpretação**: comparação entre coeficientes da regressão logística e importância de variáveis de random forest e XGBoost, verificando convergência entre modelos.

## Principais Resultados

| Métrica | Valor |
|---|---|
| Modelo final | Regressão Logística (balanceada) |
| Funcionários analisados | 1470 |
| Taxa de attrition | 16,12% |
| ROC-AUC (validação cruzada) | 0,8404 |
| F1 (validação cruzada) | 0,5183 |
| Recall (teste) | 0,6610 |
| Precisão (teste) | 0,3939 |

### Comparação entre Modelos (versão balanceada, teste)

| Modelo | ROC-AUC | F1 | Recall |
|---|---|---|---|
| Regressão Logística | 0,8143 | 0,4937 | 0,6610 |
| Random Forest | 0,7466 | 0,3830 | 0,3051 |
| XGBoost | 0,7503 | 0,3778 | 0,2881 |
| Rede Neural | 0,7426 | 0,4000 | 0,3898 |

`OverTime` foi a única variável presente entre as mais relevantes nos três modelos interpretáveis (Random Forest, XGBoost e regressão logística), com direção consistente, funcionários que fazem hora extra têm maior probabilidade prevista de saída.

## Tecnologias Utilizadas

- Python
- pandas, numpy
- scikit-learn (`OneHotEncoder`, `MinMaxScaler`, `LogisticRegression`, `RandomForestClassifier`, `StratifiedKFold`, `metrics`)
- xgboost
- tensorflow/keras
- matplotlib, seaborn

## Referências

* Curso [Ciência de Dados para Empresas e Negócios](https://iaexpert.academy/cursos-online-assinatura/ciencia-de-dados-para-empresas-e-negocios/), IAExpert Academy, instrutor Jones Granatyr.
* Dataset [IBM HR Analytics Employee Attrition & Performance](https://www.kaggle.com/pavansubhasht/ibm-hr-analytics-attrition-dataset), Kaggle.
* Documentação do [scikit-learn: sklearn.linear_model.LogisticRegression](https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.LogisticRegression.html).
* Documentação do [XGBoost](https://xgboost.readthedocs.io/).

## Autor

**Wellington M. Santos**, Cientista de Dados

[LinkedIn](https://www.linkedin.com/in/wellington-moreira-santos) · [GitHub](https://github.com/esscova) · [Contato](mailto:wsantos08@hotmail.com)

---

> Material desenvolvido para estudos e composição de portfólio a partir do curso
> [Ciência de Dados para Empresas e Negócios](https://iaexpert.academy/cursos-online-assinatura/ciencia-de-dados-para-empresas-e-negocios/), para o repositório
> [data-trivium](https://github.com/esscova/data-trivium);
