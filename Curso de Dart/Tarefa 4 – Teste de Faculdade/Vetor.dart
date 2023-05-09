import 'dart:math';

class Vetor {
  List<double> vetor = List.filled(5, 0.0);

  void alimentar() {
    for (int i = 0; i < vetor.length; i++) {
      double numeroAleatorio =
          double.parse((Random().nextDouble() * 100).toStringAsFixed(2));
      vetor[i] = numeroAleatorio;
    }
  }

  void mostrar() {
    print(vetor);
  }

  void mostrarParteInteira() {
    print(vetor.map((v) => v.toInt()).toList());
  }

  void multiplicarPorInteiro(int n) {
    print(vetor.map((v) => v * n).toList());
  }
}
