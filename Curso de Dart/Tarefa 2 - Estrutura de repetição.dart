/* Faça um programa que peça para n pessoas a sua idade, ao final o programa 
deverá verificar se a média de idade da turma varia entre 0 e 25, 26, 60 e maior que 60, 
e então, dizer se a turma é jovem, adulta ou idosa, conforme a média calculada. */

import 'dart:io';

void main() {
  bool continuar = true;
  while (continuar) {
    List<int> idades = [];
    print('******** Sistema de Turmas ******** ');
    int? qtdPessoas = lerQtdPessoas();

    for (int i = 1; i <= qtdPessoas!; i++) {
      print("Digite a idade da pessoa $i: ");
      idades.add(lerIdade()!);
    }

    double mediaIdade = idades.reduce((a, b) => a + b) / qtdPessoas;
    String classificacao = "";

    if (mediaIdade <= 25) {
      classificacao = "jovem";
    } else if (mediaIdade <= 60) {
      classificacao = "adulta";
    } else {
      classificacao = "idosa";
    }

    print(
        "A média de idade da turma é ${mediaIdade.toStringAsFixed(2)} , portanto a turma é classificada como $classificacao.");
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

int? lerQtdPessoas() {
  bool qtdPessoasValido = false;
  while (!qtdPessoasValido) {
    print('Digite o número de pessoas na turma: ');
    int? qtdPessoas = int.tryParse(stdin.readLineSync()!);
    if (qtdPessoas == null) {
      print('Quantidade de pessoas inválida! Digite novamente.');
    } else if (qtdPessoas > 0) {
      qtdPessoasValido = true;
      return qtdPessoas;
    } else {
      print('Quantidade de pessoas inválida! Digite novamente.');
    }
  }
}

int? lerIdade() {
  bool qtdPessoasValido = false;
  while (!qtdPessoasValido) {
    int? idade = int.tryParse(stdin.readLineSync()!);
    if (idade == null) {
      print('Idade inválida! Digite novamente:');
    } else if (idade > 0) {
      qtdPessoasValido = true;
      return idade;
    } else {
      print('Idade inválida! Digite novamente:');
    }
  }
}
