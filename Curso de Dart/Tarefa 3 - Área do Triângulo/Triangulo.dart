class Triangulo {
  late double base;
  late double altura;

  double get area => (base * altura) / 2;

  void exibirDados() {
    print('Base: $base');
    print('Altura: $altura');
    print('Área: ${area.toStringAsFixed(2)} m²');
  }
}
