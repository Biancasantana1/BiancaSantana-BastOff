/*Faça um programa que receba a temperatura média de cada mês do ano e armazene-as em uma lista.
 Após isto, calcule a média anual das temperaturas e mostre todas as temperaturas acima da média anual, 
 e em que mês elas ocorreram (mostrar o mês por extenso: 1 – janeiro, 2 – fevereiro...).*/

import 'dart:io';

void main() {
  const int QTD_MES = 12;
  bool continuar = true;

  while (continuar) {
    List<double> temperaturas = [];
    List<String> mesesAcimaDaMedia = [];

    print('******** Sistema de Temperatura ******** ');
    for (int i = 1; i <= QTD_MES; i++) {
      print('Informe a temperatura média do mês $i:');
      double tempMes = lerTemperatura()!;
      temperaturas.add(tempMes);
      clearConsole();
    }

    double mediaTemperaturas =
        temperaturas.reduce((acumulador, proximo) => acumulador + proximo) /
            QTD_MES;
    print(
        'A média anual das temperaturas é: ${mediaTemperaturas.toStringAsFixed(2)} °C');

    for (int i = 0; i < QTD_MES; i++) {
      if (temperaturas[i] > mediaTemperaturas) {
        String mes = converterMes(i + 1)!;
        mesesAcimaDaMedia.add('$mes: ${temperaturas[i]} °C');
      }
    }
    print("As temperaturas acima da média anual são:");
    mesesAcimaDaMedia.forEach((element) => print(element));

    continuar = lerContinuar()!;
    clearConsole();
  }
}

double? lerTemperatura() {
  bool temperaturaValida = false;
  while (!temperaturaValida) {
    double? temperatura = double.tryParse(stdin.readLineSync()!);
    if (temperatura != null && temperatura >= -60 && temperatura <= 60) {
      temperaturaValida = true;
      return temperatura;
    } else {
      print('Temperatura inválida! Digite novamente:');
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

String? converterMes(int mes) {
  switch (mes) {
    case 1:
      return 'Janeiro';
    case 2:
      return 'Fevereiro';
    case 3:
      return 'Março';
    case 4:
      return 'Abril';
    case 5:
      return 'Maio';
    case 6:
      return 'Junho';
    case 7:
      return 'Julho';
    case 8:
      return 'Agosto';
    case 9:
      return 'Setembro';
    case 10:
      return 'Outubro';
    case 11:
      return 'Novembro';
    case 12:
      return 'Dezembro';
  }
}
