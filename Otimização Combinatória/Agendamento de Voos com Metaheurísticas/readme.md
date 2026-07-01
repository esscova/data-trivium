# Agendamento de Voos com Metaheurísticas

Otimização combinatória aplicada ao problema de agendamento de voos: seis pessoas em cidades distintas precisam se encontrar em Guarulhos (GRU) e compartilhar o transporte a partir do aeroporto. O objetivo é encontrar a combinação de voos de ida e volta que minimize simultaneamente o custo total das passagens e o tempo de espera acumulado no aeroporto.

O problema é resolvido com quatro algoritmos metaheurísticos implementados do zero em Python, sem uso de bibliotecas de otimização. Os resultados são comparados em 10 execuções independentes via análise estatística e boxplot.

Desenvolvido como material de estudo e portfólio a partir do curso [Algoritmos de Otimização em Python](https://iaexpert.academy/cursos-online-assinatura/inteligencia-artificial-algoritmos-otimizacao-python/) da IAExpert Academy e, com auxílio e revisões do [Claude](https://claude.ai/) - Anthropic.

## Dataset

Arquivo `voos.txt` com voos fictícios entre seis aeroportos brasileiros (CWB, GIG, POA, FLN, CNF, GYN) e Guarulhos (GRU). Cada rota oferece 10 opções de ida e 10 de volta, com horários e preços variados.

## Técnicas e bibliotecas

- Pesquisa aleatória
- Subida da encosta (hill climbing)
- Têmpera simulada (simulated annealing)
- Algoritmo genético
- `random`, `math`, `time` (biblioteca padrão Python)
- `numpy`, `matplotlib`

## Estrutura do notebook

1. Imports e Configurações
2. O Problema e os Dados
3. Representação da Solução e Função de Custo
4. Implementação dos Algoritmos
5. Comparação de Resultados
6. Conclusão e Considerações Finais
7. Referências

## Referências

Curso [Algoritmos de Otimização em Python](https://iaexpert.academy/cursos-online-assinatura/inteligencia-artificial-algoritmos-otimizacao-python/) - IAExpert Academy, Jones Granatyr.