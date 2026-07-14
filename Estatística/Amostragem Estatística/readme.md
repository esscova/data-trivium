# Amostragem Estatística: Representatividade e Estabilidade das Estimativas

## Descrição do problema

Implemento e comparo cinco técnicas clássicas de amostragem (aleatória simples, sistemática,
por grupos, estratificada e reservatório), não apenas para demonstrar como cada uma funciona,
mas para responder uma pergunta prática: qual técnica preserva melhor as características da
população, e essa preservação é consistente ou depende da sorte da tiragem.

Para isso, repito cada técnica 500 vezes e observo a distribuição das estimativas resultantes,
em vez de comparar um único valor pontual por técnica. Essa repetição separa dois conceitos
que costumam ser tratados como um só: viés (a técnica erra sistematicamente?) e variabilidade
(a técnica é consistente entre execuções?). O achado central do projeto vem justamente dessa
separação, a amostragem por grupos não apresenta o maior viés médio, mas é a técnica mais
instável, com desvio até cinco vezes maior que as demais em uma execução isolada.

## Dataset

Adult Census Income (UCI Machine Learning Repository), 32561 registros. Utilizo um espelho
do dataset hospedado no GitHub ([pooja2512/Adult-Census-Income](https://github.com/pooja2512/Adult-Census-Income)),
com a mesma estrutura e valores do arquivo original, variando apenas a convenção de nomes das
colunas. As variáveis de referência para avaliar representatividade são `age` (idade),
`income` (renda) e `sex` (sexo).

## Técnicas e bibliotecas

- **Amostragem**: aleatória simples, sistemática, por grupos, estratificada
(`StratifiedShuffleSplit`, scikit-learn) e reservatório (Algoritmo R, Vitter 1985)
- **Simulação**: 500 repetições por técnica, com `random_state` explícito por chamada
- **Bibliotecas**: pandas, numpy, random, scikit-learn, matplotlib, seaborn

## Estrutura do notebook

1. Imports e Configurações
2. Coleta e Inspeção dos Dados
3. Análise Exploratória
   - Verificação da ordem do dataset
   - Refatoração das técnicas de amostragem
   - Execução única de cada técnica (sanidade)
   - Simulação: repetição das amostragens
   - Viés e variabilidade por técnica
4. Visualizações
5. Conclusão e Considerações Finais
6. Referências

## Autor

**Wellington M. Santos**, Cientista de Dados

[LinkedIn](https://www.linkedin.com/in/wellington-moreira-santos) · [GitHub](https://github.com/esscova) · [Contato](mailto:wsantos08@hotmail.com)

## Fonte

Projeto desenvolvido a partir do curso [Estatística para Ciência de Dados e Machine
Learning](https://iaexpert.academy/cursos-online-assinatura/estatistica-para-ciencia-de-dados-e-machine-learning/)
(IA Expert Academy), seção "População e amostra", com estruturação e aprofundamento adicional
para composição de portfólio.