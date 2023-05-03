/*Faça um programa que simule um lançamento de dados. Lance o dado 100 vezes 
e armazene os resultados em um vetor. Depois, mostre quantas vezes cada valor 
foi conseguido. Dica: use um vetor de contadores (1-6) e uma função para gerar números aleatórios, 
simulando os lançamentos dos dados.*/

import 'dart:io';
import 'dart:math';

void main() {
  bool continuar = true;
  const int QTD_DADO = 6;

  while (continuar) {
    print('******** Sistema de Simulação de dados ******** ');
    List<int> resultados = List.filled(6, 0);

    for (int i = 0; i < 100; i++) {
      int valor = gerarNumeroAleatorio(1, 6);
      resultados[valor - 1]++;
    }

    for (int i = 0; i < resultados.length; i++) {
      print("Número ${i + 1}: ${resultados[i]} vezes");
    }
    continuar = lerContinuar()!;
    clearConsole();
  }
}

int gerarNumeroAleatorio(int min, int max) {
  Random random = Random();
  return min + random.nextInt(max - min + 1);
}

bool? lerContinuar() {
  bool opcaoValida = false;
  while (!opcaoValida) {
    print('Deseja fazer novamente? (S para sim, N para não)');
    String opcao = stdin.readLineSync()!.toLowerCase();
    if (opcao == 'n') {
      opcaoValida = true;
      return false;
    } else if (opcao == 's') {
      opcaoValida = true;
      return true;
    } else {
      print('Entrada inválida! Digite S para sim ou N para não.');
    }
  }
}

void clearConsole() {
  print('\x1B[2J\x1B[0;0H');
}
