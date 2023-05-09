/*Crie um algoritmo/programa no qual o usuário deverá informar o nome, tipo,
massa e tamanho de seis corpos celestes. O programa deverá exibir na tela para 
o usuário quantos asteroides, planetas e nebulosas foram informados. Regras que
deverão ser seguidas para a implementação do algoritmo:
Os únicos tipos de corpos celestes válidos são asteroides, planetas, e nebulosas;
Caso seja informado um tipo diferente o programa deverá definir o tipo do corpo celeste como asteroide;
É obrigatório criar uma classe para representar o Corpo Celeste;
A classe deverá possuir dois atributos (propriedades) privados, massa e tamanho, 
para representar as características do corpo celeste;
A classe deverá possuir métodos de acesso para permitir 
que o usuário armazene/leia os dados dos dois atributos privados (propriedades). */

import 'dart:io';
import 'CorpoCeleste.dart';

void main() {
  List<CorpoCeleste> corposCelestes = [];
  CorpoCeleste corpoCeleste;
  int asteroides = 0;
  int planetas = 0;
  int nebulosas = 0;

  for (int i = 1; i <= 3; i++) {
    corpoCeleste = CorpoCeleste("", "", 0, 0);
    print('Informe os dados do ${i}º corpo celeste:');
    print('Nome: ');
    String nome = stdin.readLineSync()!;
    corpoCeleste.setNome(nome);
    clearConsole();
    print('Tipo (asteroides, planetas ou nebulosas): ');
    String tipo = stdin.readLineSync()!.toLowerCase();
    corpoCeleste.setTipo(tipo);
    clearConsole();
    double massa = lerMassa(corpoCeleste.getTipo());
    corpoCeleste.setMassa(massa);
    clearConsole();
    double tamanho = lerTamanho(corpoCeleste.getTipo());
    corpoCeleste.setTamanho(tamanho);
    corposCelestes.add(corpoCeleste);
    if (corpoCeleste.getTipo() == 'asteroides') {
      asteroides++;
    } else if (corpoCeleste.getTipo() == 'planetas') {
      planetas++;
    } else if (corpoCeleste.getTipo() == 'nebulosas') {
      nebulosas++;
    }
    clearConsole();
  }

  print('\nTotal de asteroides: $asteroides');
  print('Total de planetas: $planetas');
  print('Total de nebulosas: $nebulosas');
  print('Lista de corpos celestes cadastros:');
  corposCelestes.forEach((e) {
    print(e.toString());
  });
}

double lerMassa(String tipo) {
  bool massaValida = false;
  double? massa;
  double minMassa, maxMassa;
  if (tipo == 'asteroides') {
    minMassa = 1e3;
    maxMassa = 1e12;
  } else if (tipo == 'planetas') {
    minMassa = 1e22;
    maxMassa = 1e26;
  } else {
    minMassa = 1e28;
    maxMassa = 1e36;
  }

  while (!massaValida) {
    print('Massa (entre $minMassa e $maxMassa kg): ');
    massa = double.tryParse(stdin.readLineSync()!);
    if (massa == null || massa < minMassa || massa > maxMassa) {
      print('Massa inválida! Digite novamente:');
    } else {
      massaValida = true;
    }
  }
  return massa!;
}

double lerTamanho(String tipo) {
  double minTamanho, maxTamanho;
  if (tipo == 'asteroides') {
    minTamanho = 1;
    maxTamanho = 1000;
  } else if (tipo == 'planetas') {
    minTamanho = 1000;
    maxTamanho = 150000;
  } else {
    minTamanho = 1e3;
    maxTamanho = 1e6;
  }

  bool tamanhoValido = false;
  double? tamanho;
  while (!tamanhoValido) {
    print('Tamanho (entre $minTamanho e $maxTamanho km): ');
    tamanho = double.tryParse(stdin.readLineSync()!);
    if (tamanho == null || tamanho < minTamanho || tamanho > maxTamanho) {
      print('Tamanho inválido! Digite novamente:');
    } else {
      tamanhoValido = true;
    }
  }
  return tamanho!;
}

void clearConsole() {
  print('\x1B[2J\x1B[0;0H');
}
