/*
Classe Retangulo: Crie uma classe que modele um retangulo:
Atributos: LadoA, LadoB (ou Comprimento e Largura, ou Base e Altura, a escolher);
Métodos: Mudar valor dos lados, Retornar valor dos lados, calcular Área e calcular Perímetro;
Crie um programa que utilize esta classe. Ele deve pedir ao usuário que informe as medidas de
um local. Depois, deve criar um objeto com as medidas e calcular a quantidade de pisos
e de rodapés necessárias para o local.*/

import 'dart:io';
import 'Retangulo.dart';

void main() {
  bool continuar = true;

  while (continuar) {
    print('******** Sistema de Retangulo ******** ');

    print('Digite o comprimento:');
    double comprimento = lerDados();
    print('Digite a largura:');
    double largura = lerDados();

    Retangulo retangulo = Retangulo(comprimento, largura);

    double area = retangulo.calcularArea();
    double perimetro = retangulo.calcularPerimetro();

    final areaPiso = 1.0;
    final alturaRodape = 0.1;
    double areaTotal = area + (perimetro * alturaRodape);
    int quantidadePisos = (areaTotal / areaPiso).ceil();
    int quantidadeRodapes = (perimetro / alturaRodape).ceil();

    print('Área do local: ${area.toStringAsFixed(2)} m²');
    print('Perímetro do local: ${perimetro.toStringAsFixed(2)} m');
    print('Quantidade de pisos necessários: $quantidadePisos');
    print('Quantidade de rodapés necessários: $quantidadeRodapes');
    continuar = lerContinuar()!;
    clearConsole();
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
