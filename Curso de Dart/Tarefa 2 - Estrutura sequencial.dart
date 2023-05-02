/*João Papo-de-Pescador, homem de bem, comprou um microcomputador para controlar 
o rendimento diário de seu trabalho. Toda vez que ele traz um peso de peixes maior 
que o estabelecido pelo regulamento de pesca do estado de São Paulo (50 quilos) deve
pagar uma multa de R$ 4,00 por quilo excedente. João precisa que você faça um programa 
que leia a variável peso (peso de peixes) e calcule o excesso. Gravar na variável
excesso a quantidade de quilos além do limite e na variável multa o valor
da multa que João deverá pagar. Imprima os dados do programa com as mensagens adequadas.*/

import 'dart:io';

void main() {
  const double LIMITE_PESO = 50.0;
  const double VALOR_MULTA = 4.0;
  bool continuar = true;

  while (continuar) {
    print('******** Sistema de Peixes ******** ');
    double peso = lerPeso()!;

    if (peso > LIMITE_PESO) {
      double excesso = peso - LIMITE_PESO;
      double multa = excesso * VALOR_MULTA;

      print("Peso excedente: $excesso kg");
      print("Valor da multa: R\$ ${multa.toStringAsFixed(2)}");
    } else {
      print("Não houve excesso de peso.");
    }
    continuar = lerContinuar()!;
    clearConsole();
  }
}

double? lerPeso() {
  bool pesoValido = false;
  while (!pesoValido) {
    print('Digite o peso do peixe (em kg):');
    double? peso = double.tryParse(stdin.readLineSync()!);
    if (peso == null) {
      print('Peso inválido! Digite novamente.');
    } else if (peso > 0 && peso <= 2500) {
      pesoValido = true;
      return peso;
    } else {
      print('Peso invalido! Digite novamente.');
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
