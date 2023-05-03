/*Data com mês por extenso. Construa uma função que receba uma data no formato DD/MM/AAAA 
e devolva uma string no formato D de mesPorExtenso de AAAA. Opcionalmente, 
valide a data e retorne NULL caso a data seja inválida. */

import 'dart:io';

void main() {
  bool continuar = true;
  while (continuar) {
    print('******** Sistema de Datas ******** ');
    String? dataExtenso = lerData();
    if (dataExtenso != null) {
      print(dataExtenso);
    } else {
      print('Data inválida!');
    }
    continuar = lerContinuar()!;
    clearConsole();
  }
}

String? lerData() {
  bool dataValida = false;
  while (!dataValida) {
    print('Digite a data (formato: DD/MM/AAAA):');
    String? data = stdin.readLineSync();
    if (data != null && ehValidaDataFormato(data)) {
      dataValida = true;
      String? dataExtenso = dataPorExtenso(data);
      if (dataExtenso != null) {
        return dataExtenso;
      } else {
        return null;
      }
    } else {
      print('Data inválida! ');
    }
  }
}

bool ehValidaDataFormato(String data) {
  RegExp regex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
  return regex.hasMatch(data);
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

String? dataPorExtenso(String data) {
  final List<String> partes = data.split('/');

  if (partes.length != 3) {
    return null;
  }

  final int? dia = int.tryParse(partes[0]);
  final int? mes = int.tryParse(partes[1]);
  final int? ano = int.tryParse(partes[2]);

  if (dia == null || mes == null || ano == null) {
    return null;
  }

  if (dia < 1 || dia > 31 || mes < 1 || mes > 12 || ano < 1500 || ano > 2200) {
    return null;
  }

  final List<String> meses = [
    '',
    'janeiro',
    'fevereiro',
    'março',
    'abril',
    'maio',
    'junho',
    'julho',
    'agosto',
    'setembro',
    'outubro',
    'novembro',
    'dezembro',
  ];

  return '$dia de ${meses[mes]} de $ano';
}
