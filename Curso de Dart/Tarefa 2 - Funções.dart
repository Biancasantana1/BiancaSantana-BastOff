/*Faça um programa para imprimir:
1
1   2
1   2   3
.....
1   2   3   ...  n
Para um n informado pelo usuário. Use uma função que receba um valor n inteiro imprima até a n-ésima linha.*/

import 'dart:io';

void main() {
  bool continuar = true;

  while (continuar) {
    print('******** Sistema de Imprimir Numeros ******** ');
    int? qtdNumeros = lerQtdNumeros();
    imprimirNumeros(qtdNumeros!);
    continuar = lerContinuar()!;
    clearConsole();
  }
}

void imprimirNumeros(int qtdNumeros) {
  for (int i = 0; i <= qtdNumeros; i++) {
    for (int j = 1; j <= i; j++) {
      stdout.write("$j ");
    }
    stdout.write("\n");
  }
}

int? lerQtdNumeros() {
  bool qtdNumerosValido = false;
  while (!qtdNumerosValido) {
    print('Digite um numero: ');
    int? qtdNumeros = int.tryParse(stdin.readLineSync()!);
    if (qtdNumeros == null) {
      print('Numero inválido! Digite novamente.');
    } else if (qtdNumeros > 0) {
      qtdNumerosValido = true;
      return qtdNumeros;
    } else {
      print('Numero inválido! Digite novamente.');
    }
  }
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
