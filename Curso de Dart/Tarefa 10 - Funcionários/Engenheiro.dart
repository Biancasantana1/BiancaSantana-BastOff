import 'Funcionario.dart';

class Engenheiro extends Funcionario {
  String _crea;
  String _categoria;
  String _projetoAtual;

  Engenheiro(String nome, String cpf, double salario, this._crea,
      this._categoria, this._projetoAtual)
      : super(nome, cpf, salario);
  String get crea => _crea;

  set crea(String value) {
    _crea = value;
  }

  String get categoria => _categoria;

  set categoria(String value) {
    _categoria = value;
  }

  String get projetoAtual => _projetoAtual;

  set projetoAtual(String value) {
    _projetoAtual = value;
  }

  @override
  double calcularBonificacao() {
    return salario * 0.05;
  }
}
