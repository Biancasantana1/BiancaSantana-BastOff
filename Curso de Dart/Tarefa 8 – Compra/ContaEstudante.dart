import 'Compra.dart';

class ContaEstudante extends Compra {
  ContaEstudante(double preco, int parcelas, String tipo)
      : super(preco, parcelas, tipo);

  @override
  void pagarParcela() {
    double precoParcela = preco / parcelas;
    parcelas -= 1;
    preco = preco - precoParcela;
  }

  @override
  void quitarCompra() {
    parcelas = 0;
    preco = 0;
  }
}
