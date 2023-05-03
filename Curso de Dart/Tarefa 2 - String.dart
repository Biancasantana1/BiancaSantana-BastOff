/*Verificação de CPF.
Desenvolva um programa que solicite a digitação de um número de CPF no formato xxx.xxx.xxx-xx 
e indique se é um número válido ou inválido através da validação dos dígitos verificadores 
e dos caracteres de formatação.*/

import 'dart:io';

void main() {
  bool continuar = true;

  while (continuar) {
    print('******** Sistema de Tamanho de String ******** ');
    print('Insira o CPF:');
    String cpf = stdin.readLineSync()!;
    /*if (cpfFormatoValido(cpf)) {
      print('Numero de CPF válido!');
    } else {
      print('Numero de CPF inválido!');
    }
*/
    continuar = lerContinuar()!;
    clearConsole();
  }
}

/*bool cpfFormatoValido(String cpf) {
  RegExp regex = RegExp(r'^\d{3}.\d{3}.\d{3}-\d{2}$');
  if (regex.hasMatch(cpf)) return false;

  var cpfAux = cpf.replaceAll(RegExp(r'[^\d]'), '');
  // var cpfAux = cpf.replaceAll("-", "");
  // cpfAux = cpf.replaceAll(".", "");

  if (cpfAux.length != 11) return false;

  if (RegExp(r'^(\d)\1{10}$').hasMatch(cpfAux)) return false;
}*/

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
