import 'Automovel.dart';

class AutomovelDeLuxo extends Automovel {
  bool arCondicionado;
  bool direcaoHidraulica;
  bool vidroEletrico;
  bool computadorDeBordo;

  static const double PRECO_AR_CONDICIONADO = 2000.0;
  static const double PRECO_DIRECAO_HIDRAULICA = 1500.0;
  static const double PRECO_VIDRO_ELETRICO = 800.0;

  AutomovelDeLuxo(
      String placa, String modelo, int combustivel, String cor, int ano,
      {this.arCondicionado = false,
      this.direcaoHidraulica = false,
      this.vidroEletrico = false,
      this.computadorDeBordo = true})
      : super(placa, modelo, combustivel, cor, ano);

  @override
  double calcularCusto() {
    double custoBase = super.calcularCusto();
    double custoAcessorios = 0.0;
    if (arCondicionado) {
      custoAcessorios += PRECO_AR_CONDICIONADO;
    }
    if (direcaoHidraulica) {
      custoAcessorios += PRECO_DIRECAO_HIDRAULICA;
    }
    if (vidroEletrico) {
      custoAcessorios += PRECO_VIDRO_ELETRICO;
    }
    return custoBase + custoAcessorios;
  }
}
