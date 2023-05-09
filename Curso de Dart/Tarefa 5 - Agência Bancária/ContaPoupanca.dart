import 'Conta.dart';

class ContaPoupanca extends Conta {
  double rendimento;

  ContaPoupanca(int numeroConta, int agencia, double saldo, this.rendimento)
      : super(numeroConta, agencia, saldo);

  double calculaRendimento(int nMeses) {
    double saldoFinal = saldo + saldo * rendimento * nMeses;
    return saldoFinal;
  }
}
