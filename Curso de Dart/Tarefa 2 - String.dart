/*Verificação de CPF.
Desenvolva um programa que solicite a digitação de um número de CPF no formato xxx.xxx.xxx-xx 
e indique se é um número válido ou inválido através da validação dos dígitos verificadores 
e dos caracteres de formatação.*/

import 'dart:io';

void main() {
  bool continuar = true;

  while (continuar) {
    print('******** Sistema de Verificação de CPF ******** ');
    print('Insira o CPF no formato xxx.xxx.xxx-xx :');
    String cpf = stdin.readLineSync()!;
    if (cpfFormatoValido(cpf)) {
      print('Número de CPF válido!');
    } else {
      print('Número de CPF inválido!');
    }
    continuar = lerContinuar()!;
    clearConsole();
  }
}

bool cpfFormatoValido(String cpf) {
  RegExp regex = RegExp(r'^\d{3}\.\d{3}\.\d{3}-\d{2}$');
  if (!regex.hasMatch(cpf)) {
    return false;
  }
  cpf = cpf.replaceAll(".", "").replaceAll("-", "");

  if (RegExp(r'^(\d)\1{10}$').hasMatch(cpf)) return false;

  List<int> digitos = cpf.split('').map((d) => int.parse(d)).toList();
  int digito1 = calcularDigitoVerificador(digitos.sublist(0, 9));
  int digito2 = calcularDigitoVerificador(digitos.sublist(0, 9) + [digito1]);

  return digitos[9] == digito1 && digitos[10] == digito2;
}

int calcularDigitoVerificador(List<int> digitos) {
  int soma = 0;

  for (int i = 0; i < digitos.length; i++) {
    soma += digitos[i] * (digitos.length + 1 - i);
  }
  int resto = soma % 11;

  if (resto < 2) {
    return 0;
  } else {
    return 11 - resto;
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
