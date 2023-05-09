import 'dart:core';

class Visitante {
  String nome;
  String cpf;
  DateTime dataNascimento;
  int codTema;
  static const int itensVintage = 135;
  static const int itensNumismatica = 300;
  static const int itensHistoriaMusica = 67;
  static const int itensPinturas = 72;
  static const int itensEsculturas = 46;
  Visitante(this.nome, this.cpf, this.dataNascimento, this.codTema);

  void qtdItensExpostos() {
    int total = itensVintage +
        itensNumismatica +
        itensHistoriaMusica +
        itensPinturas +
        itensEsculturas;
    print('Quantidade de itens que têm exposto no museu: $total unidades.');
  }

  String obterNomeTema() {
    switch (codTema) {
      case 1:
        return 'Vintage (computadores e videogames antigos)';
      case 2:
        return 'Numismática (notas e moedas antigas)';
      case 3:
        return 'História da música';
      case 4:
        return 'Pinturas';
      case 5:
        return 'Esculturas';
      default:
        return 'Tema desconhecido';
    }
  }
}
