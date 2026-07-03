# Análise RFM para Segmentação de Clientes

Aplicação da técnica RFM (Recency, Frequency, Monetary) para segmentar a base de clientes do dataset Online Retail II, identificando grupos com diferentes perfis de comportamento de compra a partir de regras de quartis.

---

## Problema

Compreender o comportamento de compra de clientes em um varejo online é essencial para direcionar ações comerciais com eficiência. Este projeto responde à seguinte questão: como classificar clientes em grupos distintos com base em quando compraram pela última vez, com que frequência compram e quanto gastam, sem recorrer a modelos preditivos?

---

## Dataset

[Online Retail II](https://archive.ics.uci.edu/dataset/502/online+retail+ii) - UCI Machine Learning Repository

Transações de um varejo online britânico entre dezembro de 2009 e dezembro de 2010. O dataset contém 525.461 registros brutos com informações de fatura, produto, quantidade, preço unitário, data e identificação de cliente.

---

## Técnicas e bibliotecas

- Análise RFM com discretização em quartis via `pd.qcut`
- Nomeação de segmentos por regras de negócio explícitas
- `pandas` para manipulação e agrupamento dos dados
- `matplotlib` e `seaborn` para visualização
- `datetime` para cálculo de recência

---

## Estrutura do notebook

1. Imports e Configurações
2. Coleta e Inspeção dos Dados
3. Análise Exploratória — limpeza, cálculo das métricas RFM, discretização em quartis e classificação em segmentos
4. Visualizações — distribuição por segmento, valor monetário médio e dispersão recência vs. frequência
5. Conclusão e Considerações Finais
6. Referências

---

## Resultados

| Métrica | Valor |
|---|---|
| Total de clientes segmentados | 4.312 |
| Número de segmentos identificados | 6 |
| Segmento mais numeroso | Hibernando (~1.450 clientes) |
| Segmento de maior valor monetário médio | Campeões (~£10.000) |

---

## Referência

Tutorial: [Introduction to Customer Segmentation in Python](https://www.datacamp.com/tutorial/introduction-customer-segmentation-python) - DataCamp

---

> Material desenvolvido para estudos e composição de portfólio, para o repositório [data-trivium](https://github.com/esscova); com auxílio do Claude Anthropic para revisões e estruturação.