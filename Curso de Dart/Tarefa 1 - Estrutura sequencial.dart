/*Tendo como dado de entrada a altura (h) de uma pessoa, construa um algoritmo
  que calcule seu peso ideal, utilizando as seguintes fórmulas:
  Para homens: (72.7*h) - 58
  Para mulheres: (62.1*h) - 44.7 */

import 'dart:io';

void main() {
  double? altura;
  String? sexo;
  double pesoIdeal;
  bool continuar = true;

  while (continuar) {
    print('******** Sistema de peso ideal ******** ');

    altura = lerAltura();
    sexo = lerSexo();
    pesoIdeal = calcularPesoIdeal(altura!, sexo!);

    if (pesoIdeal > 0) {
      print(
          'O peso ideal com altura $altura m é de ${pesoIdeal.toStringAsFixed(2)} kg');
    } else {
      print('Não foi possível calcular o peso ideal para essa altura!');
    }

    continuar = lerContinuar()!;
    clearConsole();
  }
}

double calcularPesoIdeal(double altura, String sexo) {
  if (sexo == 'f') {
    return (62.1 * altura) - 44.7;
  } else {
    return (72.7 * altura) - 58;
  }
}

double? lerAltura() {
  bool alturaValida = false;
  while (!alturaValida) {
    print('Digite a altura (em metros): ');
    double? altura = double.tryParse(stdin.readLineSync()!);
    if (altura == null) {
      print('Altura inválida! Digite novamente.');
    } else if (altura > 0 && altura <= 10) {
      alturaValida = true;
      return altura;
    } else {
      print('Altura inválida! Digite novamente.');
    }
  }
}

String? lerSexo() {
  bool sexoValido = false;
  while (!sexoValido) {
    print('Digite o sexo (M para masculino ou F para feminino): ');
    String sexo = stdin.readLineSync()!.toLowerCase();
    if (sexo == 'f' || sexo == 'm') {
      sexoValido = true;
      return sexo;
    } else {
      print('Entrada inválida! Digite M para masculino ou F para feminino.');
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
