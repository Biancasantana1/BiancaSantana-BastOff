class Compra {
  double preco;
  int parcelas;
  String tipo;

  Compra(this.preco, this.parcelas, this.tipo);

  void pagarParcela() {
    double precoParcela = preco / parcelas;
    parcelas -= 1;
    preco = preco - precoParcela;
  }

  void quitarCompra() {
    preco = 0;
    parcelas = 0;
  }

  void cancelarCompra() {
    print('Compra cancelada');
    parcelas = 0;
    preco = 0;
  }

  void atualizarParcela(double juros, int novaQtdParcelas) {
    parcelas = novaQtdParcelas;
    double precoFinal = preco + (preco * juros * novaQtdParcelas);
    this.preco = precoFinal;
  }
}
