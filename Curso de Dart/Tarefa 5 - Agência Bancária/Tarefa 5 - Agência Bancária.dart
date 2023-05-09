/*Uma agência bancária recém-inaugurada contratou seu serviço para construir 
o sistema de contas para os clientes. O gerente da agência informou que as contas
 são divididas em dois tipos, sendo a conta corrente com os atributos (número, agência, saldo, mensalidade) 
 e conta poupança com os atributos (número, agência, saldo, rendimento). Orientações:
Implemente o conceito de herança para resolver esta questão, criando uma classe Conta 
e duas classes filhas para herdar de Contas e formar os tipos Corrente e Poupança;
Para a classe Poupança, deve-se possuir um método “calculaRendimento” com o parâmetro 
da quantidade de meses(nMeses) e deve retornar o saldo com o rendimento calculado, 
sendo: saldoFinal = saldo + saldo*rendimento*nMeses
Para a classe Corrente, deve-se possuir um método “DescontaMensalidade” que calcula 
o saldo final após o desconto da taxa de mensalidade do banco, sendo: saldoFinal = saldo - mensalidade */

import 'dart:io';
import 'ContaCorrente.dart';
import 'ContaPoupanca.dart';

void main() {
  print("***** Sistema Agência Bancária *****");

  bool continuar = true;

  while (continuar) {
    print('******** Sistema de Tamanho de String ******** ');
    print("Digite o tipo de conta:");
    print("(1) Conta corrente");
    print("(2) Conta poupança");
    int tipoConta = lerTipoConta();
    print("Digite o numero da conta(8 digitos): ");
    int conta = lerConta();
    print("Digite a agência(4 digitos):");
    int agencia = lerAgencia();
    print("Digite o saldo:");
    double saldo = lerSaldo();

    if (tipoConta == 1) {
      print("Digite o valor da mensalidade:");
      double mensalidade = lerSaldo();
      ContaCorrente contaCorrente =
          ContaCorrente(conta, agencia, saldo, mensalidade);
      if (mensalidade > contaCorrente.saldo) {
        print("Saldo insuficiente!");
      } else {
        contaCorrente.descontaMensalidade();
        print('Saldo final da conta corrente: ${contaCorrente.saldo}');
      }
    } else {
      print("Para saber o rendimento digite o numero de meses:");
      int numeroMeses = lerNumMeses();
      ContaPoupanca contaPoupanca = ContaPoupanca(conta, agencia, saldo, 0.92);
      print(
          'Saldo final da conta poupança: ${contaPoupanca.calculaRendimento(numeroMeses).toStringAsFixed(2)}');
    }

    continuar = lerContinuar()!;
    clearConsole();
  }

  ;
}

int lerTipoConta() {
  bool dadosValido = false;
  int? tipoconta;
  while (!dadosValido) {
    tipoconta = int.tryParse(stdin.readLineSync()!);
    if (tipoconta != null && tipoconta == 1) {
      dadosValido = true;
    } else if (tipoconta != null && tipoconta == 2) {
      dadosValido = true;
    } else {
      print('Tipo de conta inválida! Digite (1) Corrente ou (2) Poupança:');
    }
  }
  return tipoconta!;
}

int lerConta() {
  bool dadosValido = false;
  int? conta;
  while (!dadosValido) {
    conta = int.tryParse(stdin.readLineSync()!);
    if (conta != null && conta >= 10000000 && conta <= 99999999) {
      dadosValido = true;
    } else {
      print('Conta inválida! Digite novamente (8 digitos):');
    }
  }
  return conta!;
}

int lerAgencia() {
  bool dadosValido = false;
  int? agencia;
  while (!dadosValido) {
    agencia = int.tryParse(stdin.readLineSync()!);
    if (agencia != null && agencia >= 1000 && agencia <= 9999) {
      dadosValido = true;
    } else {
      print('Agência inválida! Digite novamente(4 digitos):');
    }
  }
  return agencia!;
}

double lerSaldo() {
  bool dadosValido = false;
  double? saldo;
  while (!dadosValido) {
    saldo = double.tryParse(stdin.readLineSync()!);
    if (saldo != null && saldo > 0) {
      dadosValido = true;
    } else {
      print('Valor inválido! Digite novamente:');
    }
  }
  return saldo!;
}

int lerNumMeses() {
  bool dadosValido = false;
  int? numMeses;
  while (!dadosValido) {
    numMeses = int.tryParse(stdin.readLineSync()!);
    if (numMeses != null && numMeses > 0) {
      dadosValido = true;
    } else {
      print('Número de meses inválido! Digite novamente:');
    }
  }
  return numMeses!;
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
