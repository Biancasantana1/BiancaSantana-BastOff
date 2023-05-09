class BombaCombustivel {
  String tipoCombustivel;
  double valorLitro;
  double quantidadeCombustivel;

  BombaCombustivel(
      this.tipoCombustivel, this.valorLitro, this.quantidadeCombustivel);

  void abastecerPorValor(double valor) {
    double litros = valor / valorLitro;
    if (litros <= quantidadeCombustivel) {
      quantidadeCombustivel -= litros;
      print("Abastecido com sucesso: ${litros.toStringAsFixed(2)} litros");
    } else {
      print("Não há combustível suficiente na bomba");
    }
  }

  void abastecerPorLitro(double litros) {
    double valor = litros * valorLitro;
    if (litros <= quantidadeCombustivel) {
      quantidadeCombustivel -= litros;
      print("Abastecido com sucesso: R\$ ${valor.toStringAsFixed(2)}");
    } else {
      print("Não há combustível suficiente na bomba");
    }
  }

  double alterarValor(double novoValorLitro) {
    return valorLitro = novoValorLitro;
  }

  String alterarCombustivel(String novoTipoCombustivel) {
    return tipoCombustivel = novoTipoCombustivel;
  }

  double alterarQuantidadeCombustivel(double novaQuantidadeCombustivel) {
    return quantidadeCombustivel = novaQuantidadeCombustivel;
  }
}
