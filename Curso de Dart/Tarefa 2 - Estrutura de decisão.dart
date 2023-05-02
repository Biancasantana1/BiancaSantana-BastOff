/* Faça um Programa que leia 2 números e em seguida pergunte ao usuário qual 
operação ele deseja realizar. O resultado da operação deve ser acompanhado de 
uma frase que diga se o número é: par ou ímpar; positivo ou negativo; inteiro ou decimal. */

import 'dart:io';

void main() {
  bool continuar = true;

  while (continuar) {
    print('******** Sistema de Calculadora ******** ');

    double? numero1 = lerNumero();
    double? numero2 = lerNumero();

    print("Escolha uma operação (+, -, *, /): ");
    String operacao = stdin.readLineSync()!;

    double resultado = 0;
    String tipoNumero = "";

    switch (operacao) {
      case "+":
        resultado = numero1! + numero2!;
        tipoNumero = verificarTipoNumero(resultado);
        print("O resultado é: $resultado ($tipoNumero)");
        break;
      case "-":
        resultado = numero1! - numero2!;
        tipoNumero = verificarTipoNumero(resultado);
        print("O resultado é: $resultado ($tipoNumero)");
        break;
      case "*":
        resultado = numero1! * numero2!;
        tipoNumero = verificarTipoNumero(resultado);
        print("O resultado é: $resultado ($tipoNumero)");
        break;
      case "/":
        if (numero2! > 0) {
          resultado = numero1! / numero2;
          tipoNumero = verificarTipoNumero(resultado);
          print("O resultado é: $resultado ($tipoNumero)");
        } else {
          print('Não é possível fazer divisão por 0');
        }
        break;
      default:
        print("Operação inválida");
    }
    continuar = lerContinuar()!;
    clearConsole();
  }
}

double? lerNumero() {
  bool numeroValido = false;
  while (!numeroValido) {
    print("Digite o número: ");
    double? numero = double.tryParse(stdin.readLineSync()!);
    if (numero != null) {
      numeroValido = true;
      return numero;
    } else {
      print('Peso invalido! Digite novamente.');
    }
  }
}

String verificarTipoNumero(double numero) {
  String tipo = "";
  if (numero % 2 == 0) {
    tipo += "par ";
  } else {
    tipo += "ímpar ";
  }

  if (numero > 0) {
    tipo += "positivo ";
  } else if (numero < 0) {
    tipo += "negativo ";
  }

  if (numero == numero.toInt().toDouble()) {
    tipo += "inteiro";
  } else {
    tipo += "decimal";
  }

  return tipo;
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
