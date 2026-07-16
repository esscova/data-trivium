\# Classificação com Dados Desbalanceados

\*Naive Bayes e Estratégias de Rebalanceamento\*



\## Descrição do projeto



Classificação de risco de crédito com um dataset de concessão de empréstimos em que a classe de interesse, maus pagadores, representa apenas 14% dos registros. O projeto mostra como um classificador pode atingir acurácia alta prevendo majoritariamente a classe dominante, mascarando um desempenho ruim justamente na classe que mais importa para o negócio. Comparo cinco estratégias para lidar com o desbalanceamento, undersampling, oversampling, a combinação dos dois, ajuste de threshold e a ausência de qualquer tratamento, avaliando por recall, precisão, F1, validação cruzada e impacto financeiro estimado, não apenas por acurácia.



\## Dataset



`credit\_data.csv`, fornecido pelo material do curso, com informações de clientes de um banco: identificador, renda, idade, valor do empréstimo e a variável alvo indicando inadimplência.



\## Técnicas e bibliotecas



\- Naive Bayes Gaussiano (classificador base)

\- Tomek Links (undersampling)

\- SMOTE (oversampling)

\- SMOTETomek (combinação de under e oversampling)

\- Ajuste de threshold de decisão

\- Validação cruzada estratificada

\- Curvas de precisão-recall

\- pandas, numpy, seaborn, matplotlib, scikit-learn, imbalanced-learn



\## Estrutura do notebook



1\. Imports e Configurações

2\. Coleta e Inspeção dos Dados

3\. Análise Exploratória

4\. Tratamento e Limpeza dos Dados

5\. Preparação para o Modelo

6\. Treinamento e Comparação de Estratégias de Balanceamento

7\. Avaliação e Comparação Final

8\. Conclusão e Considerações Finais

9\. Referências



\## Autor



\*\*Wellington M. Santos\*\*, Cientista de Dados



\[LinkedIn](https://www.linkedin.com/in/wellington-moreira-santos) · \[GitHub](https://github.com/esscova) · \[Contato](mailto:wsantos08@hotmail.com)



\## Fonte



Projeto desenvolvido a partir do curso \[Estatística para Ciência de Dados e Machine

Learning](https://iaexpert.academy/cursos-online-assinatura/estatistica-para-ciencia-de-dados-e-machine-learning/)

(IA Expert Academy), seção "População e amostra", com estruturação e aprofundamento adicional

para composição de portfólio.

