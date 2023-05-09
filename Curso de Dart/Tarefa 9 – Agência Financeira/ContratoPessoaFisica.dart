import 'Contrato.dart';

class ContratoPessoaFisica extends Contrato {
  String cpf;
  int idade;

  ContratoPessoaFisica(int numero, String contratante, double valor, int prazo,
      this.cpf, this.idade)
      : super(numero, contratante, valor, prazo);

  @override
  double calcularPrestacao() {
    double adicional;
    if (idade >= 18 && idade <= 30) {
      adicional = 1.0;
    } else if (idade <= 40) {
      adicional = 2.0;
    } else if (idade <= 50) {
      adicional = 3.0;
    } else {
      adicional = 4.0;
    }
    return super.calcularPrestacao() + adicional;
  }

  @override
  void exibirInfo() {
    super.exibirInfo();
    print("Idade do contratante: $idade");
  }
}
