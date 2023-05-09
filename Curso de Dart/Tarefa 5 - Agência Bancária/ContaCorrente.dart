import 'Conta.dart';

class ContaCorrente extends Conta {
  double mensalidade;

  ContaCorrente(int numeroConta, int agencia, double saldo, this.mensalidade)
      : super(numeroConta, agencia, saldo);

  void descontaMensalidade() {
    saldo -= mensalidade;
  }
}
