# Sumarização de Textos com PLN

Implementações progressivas de algoritmos de sumarização extrativa em português, do zero até bibliotecas de produção.

Desenvolvido como material de estudo e portfólio a partir do curso [Sumarização de Textos com Processamento de Linguagem Natural](https://iaexpert.academy/cursos-online-assinatura/sumarizacao-de-textos-com-processamento-de-linguagem-natural/) da IAExpert Academy. Os notebooks foram revisados com auxílio do [Claude](https://claude.ai) (Anthropic), que propôs as atualizações descritas na seção de adaptações abaixo.

---

## Projetos

### [1. Algoritmo Baseado em Frequência](Algoritmo%20baseado%20em%20frequencia.ipynb)
Ponto de partida da série. A premissa é simples: palavras que aparecem com mais frequência carregam mais informação sobre o tema do texto, e sentenças que concentram essas palavras merecem estar no resumo. Implementação do pipeline completo com pré-processamento, frequência proporcional, tokenização de sentenças e seleção via `heapq`. Inclui variante com lematização via spaCy e avaliação com ROUGE.

### [2. Algoritmo de Luhn](Algoritmo%20de%20Luhn.ipynb)
Extensão do projeto anterior com o critério de proximidade, proposto por Hans Peter Luhn em 1958. Em vez de somar os pesos individuais das palavras, o algoritmo identifica clusters de termos importantes dentro de cada sentença e pontua pela densidade do melhor cluster encontrado. Sentenças com termos relevantes concentrados pontuam mais do que sentenças com os mesmos termos dispersos. Pipeline expandido com leitura de feed RSS, nuvem de palavras, extração de entidades nomeadas com spaCy e exportação em HTML. Comparação direta com o algoritmo de frequência simples via ROUGE.

### [3. Similaridade do Cosseno e PageRank](Similaridade%20do%20cosseno%20e%20pagerank.ipynb)
Mudança de arquitetura em relação aos dois anteriores: em vez de avaliar cada sentença isoladamente, o algoritmo mede o quanto cada sentença se parece com todas as outras. As similaridades formam um grafo ponderado e o PageRank identifica as sentenças mais centrais na rede de significado do texto. Essa abordagem é conhecida na literatura como TextRank. Avaliação comparativa via ROUGE com os três algoritmos da série.

### [4. Algoritmos via Biblioteca sumy](Algoritmos%20via%20biblioteca%20sumy.ipynb)
Fechamento da série com seis algoritmos prontos disponíveis na biblioteca `sumy`: Luhn, LSA, LexRank, TextRank, SumBasic, KL-Sum e Reduction. Cada algoritmo é apresentado com a explicação da sua lógica interna, conectando com as implementações do zero dos projetos anteriores. Comparação ROUGE entre todos os algoritmos sobre o mesmo artigo e resumo de referência.

---

## Adaptações em relação ao material original do curso

Os notebooks do curso foram atualizados para compatibilidade com Python 3.10+ e boas práticas modernas. As principais mudanças aplicadas em toda a série:

| Original | Substituído por | Motivo |
|---|---|---|
| `goose3` | `newspaper4k` | `goose3` sem manutenção desde 2021 |
| `spacy==2.2.3` + modelo `pt` | `spacy>=3.x` + `pt_core_news_sm` | compatibilidade com Python moderno e modelo oficial atualizado |
| `nltk.FreqDist` | `collections.Counter` | biblioteca padrão, sem dependência extra |
| `nltk.cluster.util.cosine_distance` | `scipy.spatial.distance.cosine` | referência padrão, melhor documentada |
| URLs do blog IAExpert (2020) | Agência Brasil (2024) | URLs originais retornavam 404 |
| `pysummarization` | removido | abandonado desde 2019, incompatível com Python 3.10+ |

Além das substituições de dependências, cada notebook recebeu:

- narrativa objetiva com storytelling didático
- visualização com detecção de ambiente (HTML no Jupyter, texto puro como fallback)
- avaliação quantitativa via `rouge-score` ao final de cada projeto
- comparação progressiva entre os algoritmos da série usando o mesmo artigo e resumo de referência

---

## Stack

| Ferramenta | Uso |
|---|---|
| `nltk` | tokenização e stopwords |
| `collections.Counter` | frequência de palavras |
| `scipy` | similaridade do cosseno |
| `networkx` | grafo de similaridade e PageRank |
| `spacy >= 3.x` | lematização e NER |
| `newspaper4k` | extração de artigos da web |
| `feedparser` | leitura de feeds RSS |
| `wordcloud` | visualização de vocabulário |
| `sumy` | algoritmos de sumarização prontos |
| `rouge-score` | avaliação quantitativa dos resumos |

---

## Resultados ROUGE

Avaliação sobre o artigo [FMI: inteligência artificial afetará 40% dos empregos em todo o mundo](https://agenciabrasil.ebc.com.br/economia/noticia/2024-01/fmi-inteligencia-artificial-afetara-40-dos-empregos-em-todo-o-mundo) (Agência Brasil, jan/2024).

**Implementações do zero**

| Algoritmo          | ROUGE-1 F1 | ROUGE-2 F1 | ROUGE-L F1 |
|--------------------|------------|------------|------------|
| Luhn               | 0.430      | 0.224      | 0.291      |
| Cosseno/PageRank   | 0.341      | 0.123      | 0.207      |
| Frequência Simples | 0.318      | 0.080      | 0.179      |

**Algoritmos sumy**

| Algoritmo  | ROUGE-1 F1 | ROUGE-2 F1 | ROUGE-L F1 |
|------------|------------|------------|------------|
| LexRank    | 0.457      | 0.226      | 0.266      |
| Luhn       | 0.441      | 0.218      | 0.294      |
| LSA        | 0.425      | 0.192      | 0.281      |
| KL-Sum     | 0.422      | 0.195      | 0.313      |
| SumBasic   | 0.367      | 0.128      | 0.203      |
| TextRank   | 0.312      | 0.083      | 0.183      |
| Reduction  | 0.312      | 0.083      | 0.183      |

---

## Referências

Curso: [Sumarização de Textos com Processamento de Linguagem Natural](https://iaexpert.academy/cursos-online-assinatura/sumarizacao-de-textos-com-processamento-de-linguagem-natural/) - IAExpert Academy

Revisão e auxílio: [Claude](https://claude.ai) - Anthropic