/*Um grande museu recebe visitantes, no qual cada visitante possui as seguintes 
informações:nome (String), cpf(String), dataNascimento(Date) e o codTema(int).
Devido ao tamanho do museu, cada tema de exposição é separado em um andar e essa 
identificação ajuda na logística para orientar melhor cada visitante que optar pelos temas.
Os temas disponíveis para os visitantes são:
Vintage (computadores e videogames antigos) = 1; Numismática (notas e moedas antigas) = 2;
História da música = 3; Pinturas = 4; Esculturas = 5.

Estes valores devem ser declarados na classe como sendo constantes na classe.

Por curiosidade, todo visitante pode calcular quantos itens têm exposto no museu, sendo:
Vintage = 135; Numismática = 300; História da Música = 67; Pintura = 72; Esculturas = 46.

Os visitantes premium possuem as mesmas informações dos visitantes comuns e, 
adicionalmente, possuem um vale-refeição para usar na praça de alimentação dentro do museu. 
Com tudo, os visitantes premium possuem informações adicionais, como saldo(double), numeroVale(int). 
Eles recebem um vale refeição de R$100,00 para gastar somente dentro do museu.
Os visitantes premium devem calcular o quanto gastaram na praça de alimentação e retornar o saldo 
que resta na conta. Todos os visitantes devem retornar os temas que visitaram na exposição. */

import '../Tarefa 2 - String.dart';
import 'Visitante.dart';
import 'VisitantePremium.dart';
import 'dart:io';

void main() {
  print('******** Sistema de Museu ******** ');
  int quantidadeVisitantes = lerQuantidadeVisitantes();
  clearConsole();
  for (int i = 1; i <= quantidadeVisitantes; i++) {
    print('Informe os dados do visitante $i:');
    print('Digite o nome:');
    String nome = lerNome();
    clearConsole();
    print('Digite o CPF no formato xxx.xxx.xxx-xx :');
    String cpf = lerCpf();
    clearConsole();
    print('Digite a data no formato DD/MM/AAAA:');
    DateTime dataNascimento = lerData()!;
    clearConsole();
    print(
        'Escolha o tema: \n (1) Vintage (computadores e videogames antigos)\n (2) Numismática (notas e moedas antigas) \n (3) História da música \n (4) Pinturas\n (5) Esculturas');
    int codTema = lerCodTema();
    clearConsole();
    print('O visitante é premium? (1)Sim (2)Não');
    int vistPremium = lerVistPremium();
    clearConsole();
    if (vistPremium == 1) {
      VisitantePremium visitantePremium = VisitantePremium(nome, cpf,
          dataNascimento, codTema, VisitantePremium.valorValeRefeicao);
      print('Número do vale-refeição: ${visitantePremium.getNumeroVale()}');
      print('Quanto foi gasto pelo visitante?');
      double totalGastoPorVisitante = lerSaldo();
      double saldoRestante =
          visitantePremium.calcularSaldoRestante(totalGastoPorVisitante);
      print('Saldo restante de ${visitantePremium.nome}: R\$$saldoRestante');
      print(
          '${visitantePremium.nome} visitou: ${visitantePremium.obterNomeTema()}\n');
      visitantePremium.qtdItensExpostos();
    } else {
      Visitante visitante = Visitante(nome, cpf, dataNascimento, codTema);
      print('${visitante.nome} visitou: ${visitante.obterNomeTema()}\n');
      visitante.qtdItensExpostos();
    }
  }
}

bool nomeValido(String nome) {
  RegExp regex = RegExp(r'^[A-Za-z]+( [A-Za-z]+)*$');
  return regex.hasMatch(nome);
}

String lerNome() {
  bool dadosValido = false;
  String? nome;
  while (!dadosValido) {
    nome = stdin.readLineSync()!;
    if (nomeValido(nome)) {
      dadosValido = true;
    } else {
      print('Nome inválido! Digite novamente:');
    }
  }
  return nome!;
}

String lerCpf() {
  bool dadosValido = false;
  String? cpf;
  while (!dadosValido) {
    cpf = stdin.readLineSync()!;
    if (cpfFormatoValido(cpf)) {
      dadosValido = true;
    } else {
      print('Número de CPF inválido! Digite novamente:');
    }
  }
  return cpf!;
}

int lerCodTema() {
  bool dadosValido = false;
  int? codTema;
  while (!dadosValido) {
    codTema = int.tryParse(stdin.readLineSync()!);
    if (codTema != null && codTema > 0) {
      dadosValido = true;
    } else {
      print('Código do tema inválido! Digite novamente:');
    }
  }
  return codTema!;
}

double lerSaldo() {
  bool dadosValido = false;
  double? saldo;
  while (!dadosValido) {
    saldo = double.tryParse(stdin.readLineSync()!);
    if (saldo != null && saldo >= 0) {
      dadosValido = true;
    } else {
      print('Valor inválido! Digite novamente:');
    }
  }
  return saldo!;
}

DateTime? lerData() {
  bool dadosValidos = false;
  DateTime? data;

  while (!dadosValidos) {
    String? entrada = stdin.readLineSync();
    if (entrada != null) {
      List<String> dataSplit = entrada.split('/');
      if (dataSplit.length == 3) {
        int dia = int.tryParse(dataSplit[0]) ?? 0;
        int mes = int.tryParse(dataSplit[1]) ?? 0;
        int ano = int.tryParse(dataSplit[2]) ?? 0;

        if (dia > 0 && mes > 0 && ano > 1930 && ano <= 2024) {
          try {
            data = DateTime(ano, mes, dia);
            if (data.month == mes && data.day == dia && data.year == ano) {
              dadosValidos = true;
            } else {
              throw FormatException('Data inválida!');
            }
          } catch (e) {
            print('Data inválida! Digite novamente (DD/MM/AAAA):');
          }
        } else {
          print('Data inválida! Digite novamente (DD/MM/AAAA):');
        }
      } else {
        print('Data inválida! Digite novamente (DD/MM/AAAA):');
      }
    }
  }

  return data;
}

int lerQuantidadeVisitantes() {
  int? quantidade;
  bool dadosValido = false;

  print('Informe a quantidade de visitantes:');

  while (!dadosValido) {
    quantidade = int.tryParse(stdin.readLineSync()!);
    if (quantidade != null && quantidade > 0) {
      dadosValido = true;
    } else {
      print('Quantidade inválida! Digite novamente:');
    }
  }
  return quantidade!;
}

int lerVistPremium() {
  bool opcaoValida = false;
  int? opcao;
  while (!opcaoValida) {
    opcao = int.tryParse(stdin.readLineSync()!);
    if (opcao == 1) {
      opcaoValida = true;
      return 1;
    } else if (opcao == 2) {
      opcaoValida = true;
      return 2;
    } else {
      print('Entrada inválida! Digite (1) para sim ou (2) para não.');
    }
  }
  return 0;
}

void clearConsole() {
  print('\x1B[2J\x1B[0;0H');
}
