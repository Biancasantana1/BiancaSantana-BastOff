/*Faça um programa que lê as duas notas parciais obtidas por um aluno numa disciplina ao 
longo de um semestre, e calcule a sua média. A atribuição de conceitos obedece à tabela abaixo:
Média de Aproveitamento  Conceito
Entre 9.0 e 10.0        A
Entre 7.5 e 9.0         B
Entre 6.0 e 7.5         C
Entre 4.0 e 6.0         D
Entre 4.0 e zero        E

O algoritmo deve mostrar na tela as notas, a média, o conceito correspondente e 
a mensagem “APROVADO” se o conceito for A, B ou C ou “REPROVADO” se o conceito for D ou E.
*/
import 'dart:io';

void main() {
  double? notasParciais1;
  double? notasParciais2;
  double media;
  String conceito;
  bool continuar = true;

  while (continuar) {
    print('******** Sistema de Notas ******** ');

    notasParciais1 = lerNotasParciais();
    notasParciais2 = lerNotasParciais();
    clearConsole();
    print('Primeira nota: $notasParciais1');
    print('Segunda nota: $notasParciais2');
    media = calcularMedia(notasParciais1!, notasParciais2!)..toStringAsFixed(2);
    conceito = calcularConceito(media);
    print('A media é $media');
    print('O conceito é $conceito');
    if (conceito == 'A' || conceito == 'B' || conceito == 'C') {
      print('APROVADO');
    } else {
      print('REPROVADO');
    }

    continuar = lerContinuar()!;
    clearConsole();
  }
}

double? lerNotasParciais() {
  bool notasParciaisValida = false;
  while (!notasParciaisValida) {
    print('Digite a nota parcial: ');
    double? notasParciais = double.tryParse(stdin.readLineSync()!);
    if (notasParciais == null) {
      print('Nota inválida! Digite novamente.');
    } else if (notasParciais >= 0 && notasParciais <= 10) {
      notasParciaisValida = true;
      return notasParciais;
    } else {
      print('Nota inválida! Digite novamente.');
    }
  }
}

double calcularMedia(double nota1, double nota2) {
  return (nota1 + nota2) / 2;
}

String calcularConceito(double media) {
  if (media >= 9) {
    return 'A';
  } else if (media >= 7.5 && media < 9) {
    return 'B';
  } else if (media >= 6 && media < 7.5) {
    return 'C';
  } else if (media >= 4 && media < 6) {
    return 'D';
  } else {
    return 'E';
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
