import 'Contrato.dart';

class ContratoPessoaJuridica extends Contrato {
  String cnpj;
  String inscricaoEstadual;

  ContratoPessoaJuridica(int numero, String contratante, double valor,
      int prazo, this.cnpj, this.inscricaoEstadual)
      : super(numero, contratante, valor, prazo);

  @override
  double calcularPrestacao() {
    return super.calcularPrestacao() + 3.0;
  }
}
