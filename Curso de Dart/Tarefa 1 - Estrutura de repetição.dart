/* Uma academia deseja fazer um senso entre seus clientes para descobrir o mais alto, 
o mais baixo, a mais gordo e o mais magro, para isto você deve fazer um programa 
que pergunte a cada um dos clientes da academia seu código, sua altura e seu peso. 
O final da digitação de dados deve ser dado quando o usuário digitar 0 (zero) no campo código.
Ao encerrar o programa também deve ser informado os códigos e valores do cliente mais alto, 
do mais baixo, do mais gordo e do mais magro, além da média das alturas e dos pesos dos clientes */

import 'dart:io';

void main() {
  int? codigo,
      codigoMaisAlto,
      codigoMaisBaixo,
      codigoMaisGordo,
      codigoMaisMagro;
  double? altura,
      peso,
      alturaMaisAlto,
      alturaMaisBaixo,
      pesoMaisGordo,
      pesoMaisMagro;
  bool alturaValida = false;
  bool pesoValido = false;
  double somaAlturas = 0, somaPesos = 0;
  int quantidadeClientes = 0;
  List<int> codigosInseridos = [];

  // Inicializando as variáveis com valores iniciais
  alturaMaisAlto = double.negativeInfinity;
  alturaMaisBaixo = double.infinity;
  pesoMaisGordo = double.negativeInfinity;
  pesoMaisMagro = double.infinity;

  while (true) {
    print('******** Sistema de Academia ******** ');
    codigo = lerCodigo(codigosInseridos);

    if (codigo == 0) {
      break;
    }

    altura = lerAltura();
    peso = lerPeso();

    // Verificando se o cliente é o mais alto
    if (altura! > alturaMaisAlto!) {
      alturaMaisAlto = altura;
      codigoMaisAlto = codigo;
    }

    // Verificando se o cliente é o mais baixo
    if (altura < alturaMaisBaixo!) {
      alturaMaisBaixo = altura;
      codigoMaisBaixo = codigo;
    }

    // Verificando se o cliente é o mais gordo
    if (peso! > pesoMaisGordo!) {
      pesoMaisGordo = peso;
      codigoMaisGordo = codigo;
    }

    // Verificando se o cliente é o mais magro
    if (peso < pesoMaisMagro!) {
      pesoMaisMagro = peso;
      codigoMaisMagro = codigo;
    }

    // Atualizando as variáveis para a média
    somaAlturas += altura;
    somaPesos += peso;
    quantidadeClientes++;
    clearConsole();
  }

  if (quantidadeClientes > 0) {
    // Calculando a média das alturas e dos pesos
    double mediaAlturas = somaAlturas / quantidadeClientes;
    double mediaPesos = somaPesos / quantidadeClientes;

    // Imprimindo os resultados
    print(
        'Cliente mais alto: código $codigoMaisAlto, altura ${alturaMaisAlto!.toStringAsFixed(2)} m');
    print(
        'Cliente mais baixo: código $codigoMaisBaixo, altura ${alturaMaisBaixo!.toStringAsFixed(2)} m');
    print(
        'Cliente mais gordo: código $codigoMaisGordo, peso ${pesoMaisGordo!.toStringAsFixed(2)} kg');
    print(
        'Cliente mais magro: código $codigoMaisMagro, peso ${pesoMaisMagro!.toStringAsFixed(2)} kg');
    print('Media de Altura ${mediaAlturas.toStringAsFixed(2)} m');
    print('Media de Pesos ${mediaPesos.toStringAsFixed(2)} kg');
  } else {
    print('Nenhum cliente foi inserido!!');
  }
}

int? lerCodigo(List<int> codigosInseridos) {
  while (true) {
    print(
        'Digite o código do cliente (ou 0 para sair e mostrar os resultados):');
    int? codigo = int.tryParse(stdin.readLineSync()!);
    if (codigo == null) {
      print('Código inválido! Digite novamente.');
    } else if (codigo == 0) {
      return 0;
    } else if (codigosInseridos.contains(codigo)) {
      print('Código já inserido! Digite novamente.');
    } else if (codigo < 0) {
      print('Código inválido! Digite novamente.');
    } else {
      codigosInseridos.add(codigo);
      return codigo;
    }
  }
}

double? lerAltura() {
  bool alturaValida = false;
  while (!alturaValida) {
    print('Digite a altura (em metros): ');
    double? altura = double.tryParse(stdin.readLineSync()!);
    if (altura == null) {
      print('Altura inválida! Digite novamente.');
    } else if (altura > 0.9 && altura <= 3) {
      alturaValida = true;
      return altura;
    } else {
      print('Altura inválida! Digite novamente.');
    }
  }
}

double? lerPeso() {
  bool pesoValido = false;
  while (!pesoValido) {
    print('Digite o peso do cliente (em kg):');
    double? peso = double.tryParse(stdin.readLineSync()!);
    if (peso == null) {
      print('Entrada inválida! Digite novamente.');
    } else if (peso > 20 && peso <= 250) {
      pesoValido = true;
      return peso;
    } else {
      print('Entrada inválida! Digite novamente.');
    }
  }
}

void clearConsole() {
  print('\x1B[2J\x1B[0;0H');
}
