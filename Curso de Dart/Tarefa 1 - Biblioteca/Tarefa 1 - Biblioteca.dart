/*Implemente um programa no qual um usuário deverá inserir e consultar os dados 
dos livros de uma biblioteca, sendo o Título, ISBN e a quantidade de páginas. 
O programa deverá exibir os livros com a maior e menor quantidade de páginas. 
Regras que deverão ser seguidas para a implementação do algoritmo:
Crie uma classe para representar um livro, a mesma deverá possuir como atributos 
(características) um título, ISBN e a quantidade de páginas;
A classe deverá possuir também um método chamado ExibirDados, Esse método deverá 
exibir todos os atributos do livro em questão;
Ao implementar a classe é obrigatório criar dois construtores (Sobrecarga de métodos),
um que não possua parâmetro algum e outro que irá receber o título, ISBN e a quantidade de páginas. */

import 'dart:io';
import 'Livro.dart';

void main() {
  bool continuar = true;
  List<Livro> livros = [];
  print('******** Sistema de Biblioteca ******** ');
  while (continuar) {
    Livro livro = Livro();
    print('Insira os dados do livro:');
    print('ISBN:');
    livro.isbn = lerIsbn(livros);
    print('Título:');
    livro.titulo = lerTitulo();
    print('Número de páginas:');
    livro.numPaginas = lerNumeroPaginas();

    livros.add(livro);
    continuar = lerContinuar()!;
    clearConsole();
  }
  clearConsole();
  for (int i = 0; i < livros.length; i++) {
    print('Livro ${i + 1}:');
    livros[i].exibirDados();
    print('');
  }

  Livro livroMaiorPaginas = livros.reduce((a, b) {
    if (a.numPaginas > b.numPaginas) {
      return a;
    } else {
      return b;
    }
  });

  Livro livroMenorPaginas = livros.reduce((a, b) {
    if (a.numPaginas < b.numPaginas) {
      return a;
    } else {
      return b;
    }
  });
  print('*** Livro com maior número de páginas:');
  livroMaiorPaginas.exibirDados();

  print('\n*** Livro com menor número de páginas:');
  livroMenorPaginas.exibirDados();
}

bool tituloValido(String titulo) {
  RegExp regex = RegExp(r'^[A-Za-z0-9]+( [A-Za-z0-9]+)*$');
  return regex.hasMatch(titulo);
}

String lerTitulo() {
  bool dadosValido = false;
  String? entrada;
  while (!dadosValido) {
    entrada = stdin.readLineSync()!;
    if (tituloValido(entrada)) {
      dadosValido = true;
    } else {
      print('Titulo inválido! Digite novamente:');
    }
  }
  return entrada!;
}

String lerIsbn(List<Livro> livros) {
  bool dadosValido = false;
  String? isbn;
  while (!dadosValido) {
    isbn = stdin.readLineSync()!.toUpperCase().replaceAll('-', '');
    if (livros.any((livro) => livro.isbn == isbn)) {
      print('Livro já inserido! Digite novamente:');
    } else if (!isbnValido(isbn)) {
      print('ISBN inválido! Digite novamente:');
    } else {
      dadosValido = true;
    }
  }
  return isbn!;
}

bool isbnValido(String isbn) {
  RegExp regex = RegExp(r'^978\d{10}$');
  if (!regex.hasMatch(isbn)) {
    return false;
  }
  List<int> digits =
      isbn.split('').map((char) => int.tryParse(char) ?? -1).toList();

  int sum = 0;
  for (int i = 0; i < 12; i++) {
    int digit = digits[i];
    sum += (i % 2 == 0) ? digit : digit * 3;
  }

  int checkDigit = 10 - (sum % 10);
  if (checkDigit == 10) {
    checkDigit = 0;
  }

  return checkDigit == digits[12];
}

int lerNumeroPaginas() {
  bool qtdNumerosValido = false;
  int? qtdNumeros;
  while (!qtdNumerosValido) {
    qtdNumeros = int.tryParse(stdin.readLineSync()!);
    if (qtdNumeros == null) {
      print('Numero de páginas inválido! Digite novamente:');
    } else if (qtdNumeros > 0) {
      qtdNumerosValido = true;
    } else {
      print('Numero de páginas inválido! Digite novamente:');
    }
  }
  return qtdNumeros!;
}

bool? lerContinuar() {
  bool opcaoValida = false;
  while (!opcaoValida) {
    print('Deseja inserir outro livro? (S para sim, N para não)');
    String opcao = stdin.readLineSync()!.toLowerCase();
    if (opcao == 'n') {
      opcaoValida = true;
      return false;
    } else if (opcao == 's') {
      opcaoValida = true;
      return true;
    } else {
      print('Entrada inválida! Digite S para sim ou N para não.');
    }
  }
}

void clearConsole() {
  print('\x1B[2J\x1B[0;0H');
}
