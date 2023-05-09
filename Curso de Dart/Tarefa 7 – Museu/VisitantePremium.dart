import 'dart:math';

import 'Visitante.dart';

class VisitantePremium extends Visitante {
  late double saldo;
  int numeroVale = Random().nextInt(10000);

  static const double valorValeRefeicao = 100.0;

  VisitantePremium(
      String nome, String cpf, DateTime dataNascimento, int codTema, this.saldo)
      : super(nome, cpf, dataNascimento, codTema);

  int getNumeroVale() {
    return numeroVale;
  }

  double calcularSaldoRestante(double totalGasto) {
    if (totalGasto > 100) {
      print("Saldo insuficiente!");
      return saldo;
    }
    return saldo - totalGasto;
  }
}
