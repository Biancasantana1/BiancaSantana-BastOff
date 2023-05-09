import 'Funcionario.dart';

class Gerente extends Funcionario {
  String _senhaEspecial;
  int _quantidadeFuncionarios;

  Gerente(String nome, String cpf, double salario, this._senhaEspecial,
      this._quantidadeFuncionarios)
      : super(nome, cpf, salario);

  String get senhaEspecial => _senhaEspecial;

  set senhaEspecial(String value) {
    _senhaEspecial = value;
  }

  int get quantidadeFuncionarios => _quantidadeFuncionarios;

  set quantidadeFuncionarios(int value) {
    _quantidadeFuncionarios = value;
  }

  @override
  double calcularBonificacao() {
    return salario * 0.1;
  }
}
