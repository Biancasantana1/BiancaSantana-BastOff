class Matriz {
  List<List<int>> matriz = List.generate(
      3, (i) => List.generate(4, (j) => 0, growable: false),
      growable: false);

  void alimentar() {
    int valor = 0;
    for (int i = 0; i < matriz.length; i++) {
      for (int j = 0; j < matriz[i].length; j++) {
        matriz[i][j] = valor;
        valor++;
        if (valor > 50) {
          break;
        }
      }
    }
  }

  int somar() {
    int soma = 0;
    for (int i = 0; i < matriz.length; i++) {
      for (int j = 0; j < matriz[i].length; j++) {
        soma += matriz[i][j];
      }
    }
    return soma;
  }

  void mostrarMenorMaior() {
    int menor = matriz[0][0];
    int maior = matriz[0][0];
    for (int i = 0; i < matriz.length; i++) {
      for (int j = 0; j < matriz[i].length; j++) {
        if (matriz[i][j] < menor) {
          menor = matriz[i][j];
        }
        if (matriz[i][j] > maior) {
          maior = matriz[i][j];
        }
      }
    }
    print('Menor valor da matriz: $menor');
    print('Maior valor da matriz: $maior');
  }

  double calcularMedia() {
    int soma = somar();
    int quantidade = matriz.length * matriz[0].length;
    return soma / quantidade;
  }

  void mostrarMatriz() {
    String matrizString = '[';

    for (int i = 0; i < matriz.length; i++) {
      String linhaString = matriz[i].toString();
      matrizString += linhaString;

      if (i != matriz.length - 1) {
        matrizString += ', ';
      }
    }

    matrizString += ']';

    print(matrizString);
  }
}
