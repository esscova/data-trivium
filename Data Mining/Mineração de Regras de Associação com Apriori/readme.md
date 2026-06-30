# Mineração de Regras de Associação com Apriori: Market Basket Analysis

Aplicação do algoritmo Apriori para descoberta de regras de associação em dados transacionais reais, seguindo o processo KDD (Knowledge Discovery in Databases) completo: coleta, pré-processamento, transformação, mineração e análise das regras.

## Sobre o projeto

O objetivo é identificar conjuntos de produtos que são comprados juntos com frequência significativa, a partir de transações de um e-commerce britânico. O notebook documenta cada etapa do pipeline, desde a limpeza de um dataset bruto com mais de um milhão de registros até a interpretação das regras geradas, com base nas métricas clássicas de suporte, confiança e lift.

## Dataset

**Online Retail II** (UCI Machine Learning Repository): transações de uma loja de presentes do Reino Unido entre 2009 e 2011.

Link: https://archive.ics.uci.edu/dataset/502/online+retail+ii

## Técnicas e bibliotecas

- Algoritmo Apriori para geração de itemsets frequentes e regras de associação
- `pandas` para tratamento e transformação dos dados
- `mlxtend` para mineração das regras
- `matplotlib` e `seaborn` para visualização

## Estrutura do notebook

1. Imports e Configurações
2. Coleta e Inspeção dos Dados
3. Análise Exploratória
4. Tratamento e Limpeza dos Dados
5. Transformação para o Formato Transacional
6. Mineração com o Algoritmo Apriori
7. Análise das Regras de Associação
8. Conclusão e Considerações Finais
9. Referências

## Referências

Projeto desenvolvido a partir do curso [Mineração de Regras de Associação com Python, Apriori e SQL](https://iaexpert.academy/cursos-online-assinatura/mineracao-regras-associacao-python-apriori-sql/), da IAExpert Academy.

Revisão e auxílio: [Claude](https://claude.ai) - Anthropic