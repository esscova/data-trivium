# Alocação de Pessoas em Dormitórios com Metaheurísticas

Otimização combinatória aplicada ao problema de alocação de recursos limitados com restrições de preferência: dez estudantes precisam ser distribuídos em cinco dormitórios com duas vagas cada, respeitando suas primeira e segunda opções declaradas. O objetivo é minimizar a insatisfação total do grupo.

Os quatro algoritmos metaheurísticos são importados do módulo `../algoritmos/metaheuristicas.py`, desenvolvido no projeto de agendamento de voos. Nenhum algoritmo é reimplementado: o notebook demonstra a reusabilidade do módulo em um problema de representação estruturalmente diferente, baseado em permutação com remoção progressiva de vagas.

Desenvolvido como material de estudo e portfólio a partir do curso [Algoritmos de Otimização em Python](https://iaexpert.academy/cursos-online-assinatura/inteligencia-artificial-algoritmos-otimizacao-python/) da IAExpert Academy e, com auxílio e revisões do [Claude](https://claude.ai/) - Anthropic.

## Dataset

Dados sintéticos definidos diretamente no notebook: 10 estudantes com preferências declaradas para 5 dormitórios, 2 vagas cada.

## Técnicas e bibliotecas

- Pesquisa aleatória
- Subida da encosta (hill climbing)
- Têmpera simulada (simulated annealing)
- Algoritmo genético
- Representação por índice com remoção progressiva de vagas
- `random`, `numpy`, `matplotlib`
- Módulo `metaheuristicas` (local)

## Estrutura do notebook

1. Imports e Configurações
2. O Problema e os Dados
3. Representação da Solução e Função de Custo
4. Execução dos Algoritmos
5. Comparação de Resultados
6. Conclusão e Considerações Finais
7. Referências

## Referências

Curso [Algoritmos de Otimização em Python](https://iaexpert.academy/cursos-online-assinatura/inteligencia-artificial-algoritmos-otimizacao-python/) - IAExpert Academy, Jones Granatyr.