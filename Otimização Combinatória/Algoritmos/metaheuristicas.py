"""
metaheuristicas.py
------------------
Módulo de algoritmos metaheurísticos para otimização combinatória.

Implementa quatro algoritmos de busca aplicáveis a qualquer problema
que possa ser representado como um vetor de inteiros com domínio definido
por intervalos fechados.

Algoritmos disponíveis
----------------------
- pesquisa_aleatoria   : busca por amostragem uniforme no espaço de soluções
- subida_encosta       : busca local por vizinhança de passo unitário
- tempera_simulada     : busca estocástica com aceitação probabilística de pioras
- algoritmo_genetico   : busca populacional com seleção, cruzamento e mutação

Uso básico
----------
    from metaheuristicas import algoritmo_genetico

    dominio = [(0, 9)] * 12
    melhor  = algoritmo_genetico(dominio, minha_funcao_custo)

Autor  : Wellington M. Santos
GitHub : https://github.com/esscova
"""

import random
import math
from typing import Callable

Solucao = list[int]
Dominio = list[tuple[int, int]]
FuncaoCusto = Callable[[Solucao], float]


# ---------------------------------------------------------------------------
                            # Pesquisa Aleatória #
# ---------------------------------------------------------------------------

def pesquisa_aleatoria(
    dominio: Dominio,
    funcao_custo: FuncaoCusto,
    n_iter: int = 10000,
) -> Solucao:
    """
    Busca a melhor solução por amostragem aleatória uniforme.

    Gera `n_iter` soluções independentes e retorna a de menor custo.
    Serve como linha de base para comparação com os demais algoritmos.

    Parâmetros
    ----------
    dominio : list[tuple[int, int]]
        Lista de tuplas (min, max) definindo o intervalo de cada variável.
    funcao_custo : callable
        Função que recebe uma solução e retorna um valor numérico a minimizar.
    n_iter : int, opcional
        Número de soluções geradas. Padrão: 10000.

    Retorna
    -------
    list[int]
        Melhor solução encontrada.
    """
    melhor_custo   = float('inf')
    melhor_solucao = None

    for _ in range(n_iter):
        solucao = [random.randint(d[0], d[1]) for d in dominio]
        custo   = funcao_custo(solucao)
        if custo < melhor_custo:
            melhor_custo   = custo
            melhor_solucao = solucao

    return melhor_solucao


# ---------------------------------------------------------------------------
                            # Subida da Encosta #
# ---------------------------------------------------------------------------

def subida_encosta(
    dominio: Dominio,
    funcao_custo: FuncaoCusto,
) -> Solucao:
    """
    Busca local por vizinhança de passo unitário (hill climbing).

    Parte de uma solução aleatória e move-se iterativamente para o vizinho
    de menor custo até que nenhum vizinho melhore a solução corrente.
    Converge para um ótimo local, podendo ficar preso longe do ótimo global.

    Parâmetros
    ----------
    dominio : list[tuple[int, int]]
        Lista de tuplas (min, max) definindo o intervalo de cada variável.
    funcao_custo : callable
        Função que recebe uma solução e retorna um valor numérico a minimizar.

    Retorna
    -------
    list[int]
        Solução no ótimo local encontrado.

    Nota
    ----
    A geração de vizinhos respeita os limites do domínio: o vizinho inferior
    só é gerado quando solucao[i] > dominio[i][0], e o superior quando
    solucao[i] < dominio[i][1].
    """
    solucao = [random.randint(d[0], d[1]) for d in dominio]

    while True:
        vizinhos = []
        for i in range(len(dominio)):
            if solucao[i] > dominio[i][0]:
                vizinhos.append(solucao[:i] + [solucao[i] - 1] + solucao[i+1:])
            if solucao[i] < dominio[i][1]:
                vizinhos.append(solucao[:i] + [solucao[i] + 1] + solucao[i+1:])

        atual  = funcao_custo(solucao)
        melhor = atual
        for v in vizinhos:
            custo = funcao_custo(v)
            if custo < melhor:
                melhor  = custo
                solucao = v

        if melhor == atual:
            break

    return solucao


# ---------------------------------------------------------------------------
                            # Têmpera Simulada #
# ---------------------------------------------------------------------------

def tempera_simulada(
    dominio: Dominio,
    funcao_custo: FuncaoCusto,
    temperatura: float = 10000.0,
    resfriamento: float = 0.95,
    passo: int = 1,
) -> Solucao:
    """
    Busca estocástica inspirada no recozimento metalúrgico (simulated annealing).

    A cada iteração, perturba uma variável aleatória da solução corrente. Aceita
    a nova solução se ela for melhor, ou com probabilidade exp(-delta/T) se for
    pior, onde delta é a piora e T é a temperatura atual. A temperatura decresce
    geometricamente a cada passo, reduzindo a probabilidade de aceitar pioras ao
    longo do tempo.

    Parâmetros
    ----------
    dominio : list[tuple[int, int]]
        Lista de tuplas (min, max) definindo o intervalo de cada variável.
    funcao_custo : callable
        Função que recebe uma solução e retorna um valor numérico a minimizar.
    temperatura : float, opcional
        Temperatura inicial. Padrão: 10000.0.
    resfriamento : float, opcional
        Fator de decaimento da temperatura por iteração (0 < resfriamento < 1).
        Padrão: 0.95.
    passo : int, opcional
        Magnitude máxima da perturbação por iteração. Padrão: 1.

    Retorna
    -------
    list[int]
        Melhor solução encontrada ao final do resfriamento.
    """
    solucao = [random.randint(d[0], d[1]) for d in dominio]

    while temperatura > 0.1:
        i       = random.randint(0, len(dominio) - 1)
        direcao = random.randint(-passo, passo)

        solucao_temp    = solucao[:]
        solucao_temp[i] = max(dominio[i][0],
                              min(dominio[i][1], solucao_temp[i] + direcao))

        custo_atual = funcao_custo(solucao)
        custo_novo  = funcao_custo(solucao_temp)
        delta       = custo_novo - custo_atual

        if delta < 0 or random.random() < math.exp(-delta / temperatura):
            solucao = solucao_temp

        temperatura *= resfriamento

    return solucao


# ---------------------------------------------------------------------------
                            # Operadores genéticos #
# ---------------------------------------------------------------------------

def _mutacao(dominio: Dominio, solucao: Solucao, passo: int = 1) -> Solucao:
    """
    Aplica mutação de passo unitário em uma posição aleatória da solução.

    Parâmetros
    ----------
    dominio : list[tuple[int, int]]
        Lista de tuplas (min, max) definindo o intervalo de cada variável.
    solucao : list[int]
        Solução a ser mutada.
    passo : int, opcional
        Magnitude da mutação. Padrão: 1.

    Retorna
    -------
    list[int]
        Nova solução com uma variável alterada em +passo ou -passo.
    """
    i = random.randint(0, len(dominio) - 1)
    if random.random() < 0.5:
        return solucao[:i] + [max(dominio[i][0], solucao[i] - passo)] + solucao[i+1:]
    else:
        return solucao[:i] + [min(dominio[i][1], solucao[i] + passo)] + solucao[i+1:]


def _cruzamento(dominio: Dominio, s1: Solucao, s2: Solucao) -> Solucao:
    """
    Combina dois indivíduos por cruzamento de um ponto (single-point crossover).

    Parâmetros
    ----------
    dominio : list[tuple[int, int]]
        Lista de tuplas (min, max). Usado apenas para definir o limite do corte.
    s1 : list[int]
        Primeiro pai.
    s2 : list[int]
        Segundo pai.

    Retorna
    -------
    list[int]
        Filho formado pelo prefixo de s1 e sufixo de s2.
    """
    i = random.randint(1, len(dominio) - 2)
    return s1[:i] + s2[i:]


# ---------------------------------------------------------------------------
                            # Algoritmo Genético #
# ---------------------------------------------------------------------------

def algoritmo_genetico(
    dominio: Dominio,
    funcao_custo: FuncaoCusto,
    tamanho_populacao: int = 100,
    passo: int = 1,
    prob_mutacao: float = 0.2,
    elitismo: float = 0.2,
    n_geracoes: int = 500,
) -> Solucao:
    """
    Busca populacional inspirada na evolução biológica (genetic algorithm).

    Mantém uma população de soluções e a evolui ao longo de gerações por meio
    de seleção elitista, cruzamento e mutação. Os melhores indivíduos de cada
    geração são preservados automaticamente (elitismo).

    Parâmetros
    ----------
    dominio : list[tuple[int, int]]
        Lista de tuplas (min, max) definindo o intervalo de cada variável.
    funcao_custo : callable
        Função que recebe uma solução e retorna um valor numérico a minimizar.
    tamanho_populacao : int, opcional
        Número de indivíduos por geração. Padrão: 100.
    passo : int, opcional
        Magnitude da mutação. Padrão: 1.
    prob_mutacao : float, opcional
        Probabilidade de aplicar mutação em vez de cruzamento ao gerar um
        novo indivíduo. Padrão: 0.2.
    elitismo : float, opcional
        Fração da população preservada por elitismo a cada geração. Padrão: 0.2.
    n_geracoes : int, opcional
        Número de gerações. Padrão: 500.

    Retorna
    -------
    list[int]
        Melhor solução encontrada ao longo de todas as gerações.
    """
    populacao = [
        [random.randint(d[0], d[1]) for d in dominio]
        for _ in range(tamanho_populacao)
    ]

    n_elite = int(elitismo * tamanho_populacao)

    for _ in range(n_geracoes):
        custos    = sorted((funcao_custo(ind), ind) for ind in populacao)
        ordenados = [ind for _, ind in custos]
        populacao = ordenados[:n_elite]

        while len(populacao) < tamanho_populacao:
            if random.random() < prob_mutacao:
                idx = random.randint(0, n_elite - 1)
                populacao.append(_mutacao(dominio, ordenados[idx], passo))
            else:
                i1 = random.randint(0, n_elite - 1)
                i2 = random.randint(0, n_elite - 1)
                populacao.append(_cruzamento(dominio, ordenados[i1], ordenados[i2]))

    return custos[0][1]