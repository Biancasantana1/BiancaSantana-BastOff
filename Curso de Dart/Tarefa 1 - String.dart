/*Tamanho de strings. Faça um programa que leia 2 strings e informe o 
conteúdo delas seguido do seu comprimento. Informe também se as duas strings 
possuem o mesmo comprimento e são iguais ou diferentes no conteúdo.
Exemplo:

Entrada:
    Brasil Hexa 2006
    Brasil! Hexa 2006!

Saída:
    Tamanho de "Brasil Hexa 2006": 16 caracteres
    Tamanho de "Brasil! Hexa 2006!": 18 caracteres
    As duas strings são de tamanhos diferentes.
    As duas strings possuem conteúdo diferente. */

import 'dart:io';

void main() {
  bool continuar = true;

  while (continuar) {
    print('******** Sistema de Tamanho de String ******** ');
    print('Digite a primeira string:');
    String texto1 = stdin.readLineSync()!.toLowerCase();
    print('Digite a segunda string:');
    String texto2 = stdin.readLineSync()!.toLowerCase();

    print('Tamanho de "$texto1": ${texto1.length} caracteres');
    print('Tamanho de "$texto2": ${texto2.length} caracteres');

    if (texto1.length == texto2.length) {
      print('As duas strings são de tamanhos iguais.');
    } else {
      print('As duas strings são de tamanhos diferentes.');
    }

    if (texto1 == texto2) {
      print('As duas strings possuem conteúdo iguais.');
    } else {
      print('As duas strings possuem conteúdo diferente.');
    }

    continuar = lerContinuar()!;
    clearConsole();
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
