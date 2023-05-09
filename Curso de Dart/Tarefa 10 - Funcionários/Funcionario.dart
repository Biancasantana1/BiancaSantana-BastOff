class Funcionario {
  String nome;
  String cpf;
  double salario;

  Funcionario(this.nome, this.cpf, this.salario);

  double calcularBonificacao() {
    return 0;
  }

  void adicionarBonificacao(Funcionario funcionario) {
    double bonificacao = funcionario.calcularBonificacao();
    print('Bonificação adicionada: $bonificacao');
  }
}
