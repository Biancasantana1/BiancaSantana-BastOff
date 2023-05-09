/*Em um teste de faculdade, o professor de Programação Orientada a Objetos (POO) 
pediu para que os alunos criassem os seguintes itens:
Crie um vetor de 5 elementos do tipo float:
Crie um método que alimente este vetor;
Crie um método que mostre os valores desse vetor;
Crie um método que mostre somente a parte inteira dos valores desse vetor
Crie um método que multiplique por um número inteiro todos os valores do vetor.
Declare uma matriz 3 x 4:
Crie um método que alimente a matriz com números de 0 a 50;
Crie um método que some os números da matriz;
Crie um método que mostre o menor e o maior valor;
Crie um método que mostre a média dos valores.
Crie uma classe pessoa, com os seguintes atributos: nome, endereço, telefone, idade e altura 
e com o método para imprimir uma mensagem.*/
import 'Matriz.dart';
import 'Pessoa.dart';
import 'Vetor.dart';

void main() {
  Vetor v = Vetor();
  print("***** Sistema teste de faculdade *****");
  print("*** Vetor ***");
  v.alimentar();
  print("Mostrando vetor em float:");
  v.mostrar();
  print("Mostrando vetor em inteiro:");
  v.mostrarParteInteira();
  print("Multiplicando por um numero inteiro:");
  v.multiplicarPorInteiro(2);

  Matriz m = Matriz();
  print("*** Matriz ***");
  m.alimentar();
  print("Mostrando a matriz gerada:");
  m.mostrarMatriz();
  print("Soma da matriz: ${m.somar()}");
  m.mostrarMenorMaior();
  print("Media da matriz: ${m.calcularMedia()}");

  print("*** Pessoa ***");
  Pessoa p = Pessoa('João', 'Rua A, 123', '123456789', 30, 1.80);
  p.imprimirMensagem();
}
