# Clusterização de Clientes de Cartão de Crédito com K-Means

Segmentação de clientes de cartão de crédito a partir do comportamento de uso, sem rótulos prévios, usando K-Means e validação estatística de clusters.

## Objetivo

Este projeto identifica perfis de clientes de uma operadora de cartão de crédito a partir de atributos de uso (saldo, compras, saques, limite, frequência de pagamento), sem qualquer informação prévia sobre a que grupo cada cliente pertence. O objetivo não é prever uma variável conhecida, é descobrir uma estrutura de agrupamento que já exista nos dados e validar estatisticamente que essa estrutura é real, e não um artefato do algoritmo.

## Sobre o Dataset

[Credit Card Dataset for Clustering](https://www.kaggle.com/datasets/arjunbhasin2013/ccdata), Kaggle. Reúne o comportamento de uso de 8950 titulares de cartão de crédito ao longo de um período de referência de 6 meses, com 17 atributos de uso além do identificador do cliente (saldo, compras à vista e parceladas, saques, limite de crédito, pagamentos, entre outros).

## Metodologia

1. **Inspeção e limpeza**: remoção de atributos não informativos (`CUST_ID`, identificador; `TENURE`, quase constante), tratamento de 314 valores ausentes por mediana.
2. **Análise exploratória**: identificação de dois grupos de atributos redundantes entre si e praticamente independentes um do outro, um ligado a compras, outro a saques, achado que se confirma nos clusters finais.
3. **Padronização**: `StandardScaler`, necessário dado que o K-Means se baseia em distância euclidiana e os atributos têm escalas muito diferentes.
4. **Escolha de k**: varredura sistemática de k=2 a 10 pelo método do cotovelo e pelo coeficiente de Silhouette. A curva de cotovelo não apresenta uma quebra nítida, o Silhouette aponta k=3 como melhor valor.
5. **Validação do agrupamento**: três métricas de clusterização (Silhouette, Davies-Bouldin, Calinski-Harabasz), comparação contra dados aleatórios de mesma dimensão, e teste de estabilidade em três subconjuntos aleatórios da base.
6. **Interpretação**: redução de dimensionalidade com PCA para visualização em duas dimensões, e perfil estatístico de cada cluster para nomeação dos grupos.

## Principais Resultados

| Métrica | Valor |
|---|---|
| Número de clusters (k) | 3 |
| Silhouette | 0,2675 |
| Davies-Bouldin | 1,5218 |
| Calinski-Harabasz | 1736,54 |
| Variância explicada pelo PCA (2D) | 50,44% |
| Total de clientes analisados | 8950 |

Contra dados aleatórios de mesma dimensão, o Silhouette dos dados reais é quase 6,7 vezes maior, e o Calinski-Harabasz é 4,6 vezes maior, evidência de que a estrutura encontrada é genuína.

### Perfis de Cliente

| Cluster | Tamanho | Nome | Característica central |
|---|---|---|---|
| 0 | 1241 (13,9%) | Compradores Engajados | Maior frequência e volume de compras, melhor taxa de quitação integral |
| 1 | 6117 (68,3%) | Uso Ocasional | Valores baixos em quase todos os atributos, maioria da base |
| 2 | 1592 (17,8%) | Dependentes de Saque | Uso intenso de saque, menor taxa de quitação integral |

## Tecnologias Utilizadas

- Python
- pandas, numpy
- scikit-learn (`StandardScaler`, `KMeans`, `PCA`, `metrics`)
- matplotlib, seaborn

## Referências

* Curso [Clustering: Extraindo Padrões de Dados](https://www.alura.com.br/conteudo/cluster-analysis), Alura, instrutora Thainá Mariani.
* Dataset [Credit Card Dataset for Clustering](https://www.kaggle.com/datasets/arjunbhasin2013/ccdata), Kaggle.
* Documentação do [scikit-learn: sklearn.cluster.KMeans](https://scikit-learn.org/stable/modules/generated/sklearn.cluster.KMeans.html).
* Documentação do [scikit-learn: métricas de clusterização](https://scikit-learn.org/stable/modules/clustering.html#clustering-performance-evaluation).

## Autor

**Wellington M. Santos**, Cientista de Dados

[LinkedIn](https://www.linkedin.com/in/wellington-moreira-santos) · [GitHub](https://github.com/esscova) · [Contato](mailto:wsantos08@hotmail.com)

---

> Material desenvolvido para estudos e composição de portfólio a partir do curso
> [Clustering: Extraindo Padrões de Dados](https://www.alura.com.br/conteudo/cluster-analysis), para o repositório
> [data-trivium](https://github.com/esscova/data-trivium);
> com auxílio do Claude Anthropic para revisões e estruturação.
