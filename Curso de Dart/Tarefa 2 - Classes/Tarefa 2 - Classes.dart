/* Classe Bomba de Combustível: Faça um programa completo utilizando classes e métodos que:
Possua uma classe chamada bombaCombustível, com no mínimo esses atributos:
    - tipoCombustivel; - valorLitro; - quantidadeCombustivel.

Possua no mínimo esses métodos:

 - abastecerPorValor( ) – método onde é informado o valor a ser abastecido 
 e mostra a quantidade de litros que foi colocada no veículo;
 - abastecerPorLitro( ) – método onde é informado a quantidade em litros de combustível 
 e mostra o valor a ser pago pelo cliente;
 - alterarValor( ) – altera o valor do litro do combustível;
 - alterarCombustivel( ) – altera o tipo do combustível;
 - alterarQuantidadeCombustivel( ) – altera a quantidade de combustível restante na bomba;

OBS: Sempre que acontecer um abastecimento é necessário atualizar a quantidade de combustível total na bomba.*/

import 'dart:io';
import 'BombaCombustivel.dart';

void main() {
  bool continuar = true;
  BombaCombustivel bombaCombustivelGasolina =
      BombaCombustivel("Gasolina", 5.44, 150);
  BombaCombustivel bombaCombustivelAlcool =
      BombaCombustivel("Alcool", 4.44, 150);

  while (continuar) {
    print('******** Sistema de Bomba de Combustível ******** ');

    print("Qual tipo do combustivel? A para Alcool ou G para Gasolina");
    String tipoCombustivel = lerTipoCombustivel();

    print(
        "Deseja abastecer por litro(L) ou valor(V), Digite L para litro e V para valor?");
    String opcao = lerValorOuLitro();

    print("Digite a quantidade:");
    double quantidade = lerDados();
    abastecer(tipoCombustivel, opcao, quantidade, bombaCombustivelGasolina,
        bombaCombustivelAlcool);

    continuar = lerContinuar()!;
    clearConsole();
  }
}

void abastecer(
    String tipoCombustivel,
    String opcao,
    double quantidade,
    BombaCombustivel bombaCombustivelGasolina,
    BombaCombustivel bombaCombustivelAlcool) {
  if (tipoCombustivel == 'G') {
    if (opcao == 'V') {
      bombaCombustivelGasolina.abastecerPorValor(quantidade);
    } else {
      bombaCombustivelGasolina.abastecerPorLitro(quantidade);
    }
    print(
        "Quantidade de Combustivel de Gasolina restante: ${bombaCombustivelGasolina.quantidadeCombustivel.toStringAsFixed(2)}");
  } else {
    if (opcao == 'V') {
      bombaCombustivelAlcool.abastecerPorValor(quantidade);
    } else {
      bombaCombustivelAlcool.abastecerPorLitro(quantidade);
    }
    print(
        "Quantidade de Combustivel de Alcool restante: ${bombaCombustivelAlcool.quantidadeCombustivel.toStringAsFixed(2)}");
  }
}

double lerDados() {
  bool dadosValido = false;
  double? entrada;
  while (!dadosValido) {
    entrada = double.tryParse(stdin.readLineSync()!);
    if (entrada != null && entrada > 0) {
      dadosValido = true;
    } else {
      print('Entrada inválida! Digite novamente:');
    }
  }
  return entrada!;
}

String lerValorOuLitro() {
  bool dadosValido = false;
  String? entrada;
  while (!dadosValido) {
    entrada = stdin.readLineSync()!.toUpperCase();
    if (entrada == 'V' || entrada == 'L') {
      dadosValido = true;
    } else {
      print('Entrada inválida! Digite novamente:');
    }
  }
  return entrada!;
}

String lerTipoCombustivel() {
  bool dadosValido = false;
  String? entrada;
  while (!dadosValido) {
    entrada = stdin.readLineSync()!.toUpperCase();
    if (entrada == 'G' || entrada == 'A') {
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
