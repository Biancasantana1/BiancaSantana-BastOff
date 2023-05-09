class Livro {
  late String titulo;
  late String isbn;
  late int numPaginas;

  Livro();

  Livro.comDados(this.titulo, this.isbn, this.numPaginas);

  void exibirDados() {
    print('Título: $titulo');
    print('ISBN: $isbn');
    print('Número de páginas: $numPaginas');
  }
}
