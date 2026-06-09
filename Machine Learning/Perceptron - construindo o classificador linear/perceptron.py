"""
Módulo que implementa o algoritmo Perceptron para classificação binária de dados lineares.

O Perceptron é um classificador linear supervisionado, baseado no modelo de neurônio artificial
proposto por Frank Rosenblatt. É adequado para problemas de classificação binária onde os dados
são linearmente separáveis.

Exemplo de uso:
    >>> from perceptron import Perceptron
    >>> import numpy as np
    >>> X = np.array([[1, 2], [2, 3], [3, 4], [4, 5]])
    >>> y = np.array([0, 0, 1, 1])
    >>> model = Perceptron(learning_rate=0.1, epochs=1000, verbose=True)
    >>> model.fit(X, y)
    >>> predictions = model.predict(X)
    >>> accuracy = model.score(X, y)
"""

import numpy as np


def heaviside(x: np.ndarray) -> np.ndarray:
    """
    Função de ativação Heaviside (degrau).

    Retorna 1 se o valor de entrada for maior ou igual a 0, caso contrário, retorna 0.

    Args:
        x (np.ndarray): Array de valores de entrada.

    Returns:
        np.ndarray: Array com valores 0 ou 1, dependendo da condição.

    Exemplo:
        >>> heaviside(np.array([-1, 0, 1]))
        array([0, 1, 1])
    """
    return np.where(x >= 0, 1, 0)


class Perceptron:
    """
    Classificador Perceptron para dados linearmente separáveis.

    Atributos:
        learning_rate (float): Taxa de aprendizado para atualização dos pesos.
        epochs (int): Número máximo de épocas para treinamento.
        verbose (bool): Se True, exibe logs durante o treinamento.
        log_every (int): Frequência (em épocas) para exibir logs.
        random_state (int, optional): Semente para reprodutibilidade dos resultados.
        weights (np.ndarray): Pesos do modelo após treinamento.
        bias (float): Viés do modelo após treinamento.
        errors (list): Histórico de erros por época.
        accuracy_history (list): Histórico de acurácia por época.

    Exemplo:
        >>> model = Perceptron(learning_rate=0.01, epochs=1000, verbose=True)
        >>> model.fit(X_train, y_train)
        >>> y_pred = model.predict(X_test)
        >>> accuracy = model.score(X_test, y_test)
    """

    def __init__(
        self,
        learning_rate: float = 0.1,
        epochs: int = 1000,
        verbose: bool = False,
        log_every: int = 10,
        random_state: int | None = None,
    ) -> None:
        """
        Inicializa o classificador Perceptron.

        Args:
            learning_rate (float, optional): Taxa de aprendizado. Default: 0.1.
            epochs (int, optional): Número máximo de épocas. Default: 1000.
            verbose (bool, optional): Se True, exibe logs durante o treinamento. Default: False.
            log_every (int, optional): Frequência (em épocas) para exibir logs. Default: 10.
            random_state (int, optional): Semente para reprodutibilidade. Default: None.
        """
        self.learning_rate = learning_rate
        self.epochs = epochs
        self.verbose = verbose
        self.log_every = log_every
        self.random_state = random_state

        self.weights: np.ndarray | None = None
        self.bias: float | None = None
        self.errors: list[int] = []
        self.accuracy_history: list[float] = []

    def fit(self, X: np.ndarray, y: np.ndarray) -> None:
        """
        Treina o modelo Perceptron com os dados de entrada.

        Args:
            X (np.ndarray): Matriz de características (n_samples, n_features).
            y (np.ndarray): Vetor de rótulos binários (0 ou 1) de tamanho n_samples.

        Raises:
            ValueError: Se X e y tiverem tamanhos incompatíveis.

        Exemplo:
            >>> model.fit(X_train, y_train)
        """
        n_samples, n_features = X.shape
        if len(y) != n_samples:
            raise ValueError("X e y devem ter o mesmo número de amostras.")

        rng = np.random.RandomState(self.random_state)

        self.weights = np.zeros(n_features)
        self.bias = 0
        self.errors = []
        self.accuracy_history = []

        for epoch in range(self.epochs):
            erros_epoca = 0
            indices = rng.permutation(n_samples)
            X_shuffled = X[indices]
            y_shuffled = y[indices]

            for idx, x_i in enumerate(X_shuffled):
                linear_output = np.dot(x_i, self.weights) + self.bias
                y_predicted = 1 if linear_output >= 0 else 0

                update = self.learning_rate * (y_shuffled[idx] - y_predicted)

                if update != 0:
                    self.weights += update * x_i
                    self.bias += update
                    erros_epoca += 1

            self.errors.append(erros_epoca)
            accuracy = np.mean(self.predict(X) == y)
            self.accuracy_history.append(accuracy)

            if self.verbose and ((epoch + 1) % self.log_every == 0 or epoch == 0):
                print(
                    f"Época: {epoch + 1:>4}/{self.epochs:<4} | "
                    f"Erros: {erros_epoca:>3} | "
                    f"Acurácia: {accuracy:>7.2%} | "
                    f"Bias: {self.bias:>8.4f}"
                )

            if erros_epoca == 0:
                print(f"\nConvergência alcançada na época {epoch + 1}.")
                break

    def predict(self, X: np.ndarray) -> np.ndarray:
        """
        Prediz os rótulos para as amostras de entrada.

        Args:
            X (np.ndarray): Matriz de características (n_samples, n_features).

        Returns:
            np.ndarray: Vetor de predições binárias (0 ou 1).

        Exemplo:
            >>> y_pred = model.predict(X_test)
        """
        linear_output = np.dot(X, self.weights) + self.bias
        return heaviside(linear_output)

    def score(self, X: np.ndarray, y: np.ndarray) -> float:
        """
        Calcula a acurácia do modelo para os dados de entrada.

        Args:
            X (np.ndarray): Matriz de características (n_samples, n_features).
            y (np.ndarray): Vetor de rótulos verdadeiros (0 ou 1).

        Returns:
            float: Acurácia do modelo (0 a 1).

        Exemplo:
            >>> accuracy = model.score(X_test, y_test)
        """
        predictions = self.predict(X)
        return np.mean(predictions == y)