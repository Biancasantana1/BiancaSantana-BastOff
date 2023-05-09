class Contrato {
  int numero;
  String contratante;
  double valor;
  int prazo;

  Contrato(this.numero, this.contratante, this.valor, this.prazo);

  double calcularPrestacao() {
    return valor / prazo;
  }

  void exibirInfo() {
    print("Valor do contrato: $valor");
    print("Prazo: $prazo");
    print("Valor da prestação: ${calcularPrestacao().toStringAsFixed(2)}");
  }
}
