/*Crie um programa que exiba para o usuário qual é a área de um triângulo. 
Para implementar esse programa você deverá seguir as seguintes regras:
O usuário deverá informar para o programa os valores da base e da altura do triângulo;
É obrigatório criar/utilizar uma classe para representar o triângulo;
A base e a altura informada pelo usuário deverão ser representadas na classe como propriedades;
O objeto deverá possuir uma propriedade para exibir o valor da área do triângulo;
O objeto deverá possuir um método que exiba os dados de todas as suas propriedades.*/

import 'dart:io';
import 'Triangulo.dart';

void main() {
  Triangulo triangulo = Triangulo();
  bool continuar = true;

  while (continuar) {
    print('******** Sistema de Triângulo ******** ');
    print('Informe a base do triângulo: ');
    triangulo.base = lerDados();

    print('Informe a altura do triângulo: ');
    triangulo.altura = lerDados();
    clearConsole();

    triangulo.exibirDados();
    continuar = lerContinuar()!;
    clearConsole();
  }
}

double lerDados() {
  bool dadosValido = false;
  double? entrada;
  while (!dadosValido) {
    entrada = double.tryParse(stdin.readLineSync()!);
    if (entrada == null) {
      print('Entrada inválida! Digite novamente:');
    } else if (entrada > 0) {
      dadosValido = true;
    } else {
      print('Entrada inválida! Digite novamente:');
    }
  }
  return entrada!;
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
