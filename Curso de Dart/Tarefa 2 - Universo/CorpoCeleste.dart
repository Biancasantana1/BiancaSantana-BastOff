class CorpoCeleste {
  String nome;
  String tipo;
  double _massa;
  double _tamanho;

  CorpoCeleste(this.nome, this.tipo, this._massa, this._tamanho);

  String getNome() {
    return nome;
  }

  String getTipo() {
    return tipo;
  }

  double getMassa() {
    return _massa;
  }

  double getTamanho() {
    return _tamanho;
  }

  void setNome(String nome) {
    this.nome = nome;
  }

  void setTipo(String tipo) {
    if (tipo == 'asteroides' || tipo == 'planetas' || tipo == 'nebulosas') {
      this.tipo = tipo;
    } else {
      this.tipo = 'asteroides';
    }
  }

  void setMassa(double massa) {
    this._massa = massa;
  }

  void setTamanho(double tamanho) {
    this._tamanho = tamanho;
  }

  @override
  String toString() {
    return 'Nome: ${getNome()}, Massa: ${getMassa()}, tamanho ${getTamanho()}, Tipo: ${getTipo()}';
  }
}
