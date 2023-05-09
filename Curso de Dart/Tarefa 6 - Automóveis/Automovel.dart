class Automovel {
  String placa;
  String modelo;
  int combustivel;
  String cor;
  int ano;

  static const int GASOLINA = 1;
  static const int ALCOOL = 2;
  static const int DIESEL = 3;
  static const int GAS = 4;

  Automovel(this.placa, this.modelo, this.combustivel, this.cor, this.ano);

  double calcularCusto() {
    switch (combustivel) {
      case GASOLINA:
        return 12000.0;
      case ALCOOL:
        return 10500.0;
      case DIESEL:
        return 11000.0;
      case GAS:
        return 13000.0;
      default:
        return 0.0;
    }
  }
}
