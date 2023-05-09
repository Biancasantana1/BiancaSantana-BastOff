class Pessoa {
  String nome;
  String endereco;
  String telefone;
  int idade;
  double altura;

  Pessoa(this.nome, this.endereco, this.telefone, this.idade, this.altura);

  void imprimirMensagem() {
    print(
        'Olá, meu nome é $nome. Eu tenho $idade anos e minha altura é $altura metros.');
  }
}
