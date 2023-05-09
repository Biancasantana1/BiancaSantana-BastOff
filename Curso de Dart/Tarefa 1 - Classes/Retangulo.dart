class Retangulo {
  double comprimento;
  double largura;

  Retangulo(this.comprimento, this.largura);

  void mudarLados(double novoComprimento, double novaLargura) {
    comprimento = novoComprimento;
    largura = novaLargura;
  }

  List<double> retornarLados() {
    return [comprimento, largura];
  }

  double calcularArea() {
    return comprimento * largura;
  }

  double calcularPerimetro() {
    return 2 * (comprimento + largura);
  }
}
