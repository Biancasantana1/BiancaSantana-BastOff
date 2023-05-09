/*Vamos criar uma classe Compra, que possua os atributos preço(double), parcelas(int) e tipo(String) 
e os métodos pagarParcela, quitarCompra e cancelarCompra:
O método pagarParcela, decrementa o valor no atributo parcelas;
O método quitarCompra atualiza o atributo parcela com o valor zero;
O método cancelarCompra imprime uma mensagem de compra cancelada e atualiza o atributo 
parcela com o valor zero.
É possível renegociar a compra, para isso, adicione o método atualizarParcela 
que possua um parâmetro referente a taxa de juros e outro com a nova quantidade de parcelas.
Para esse método, atualize o atributo parcela com a nova quantidade de parcelas, calcule o 
novo preço com base na fórmula: preçoFinal = preço + preço*juros*qtdParcelas. 
Logo após o cálculo, atualize o atributo preço com o valor calculado em preçoFinal;
Crie uma classe ContaEstudante herdada da classe Compra: 
Na classe ContaEstudante, o método pagarParcela deve ser sobrescrito para que o número de parcelas 
diminua de 1 unidade a cada vez que for chamado;
Na classe ContaEstudante, o método quitarConta também deve ser sobrescrito para que o 
atributo parcelas receba o valor zero;
Crie um método que receba como parâmetro um objeto. Use o operador instanceof para 
verificar o tipo do objeto, se for uma Compra some os preços e os números de parcelas
e imprima tais valores no terminal. Se for uma conta de aluno, divida o preço e o número 
de parcelas por 2 e imprima os valores no terminal.*/
import 'Compra.dart';
import 'ContaEstudante.dart';
import 'dart:io';

void main() {
  double preco;
  int parcelas;
  String tipo;
  int opcao;
  bool continuar = true;

  while (continuar) {
    print('******** Sistema de Compra ******** ');
    print('Insira: \n (1) Compra\n (2) Conta de Estudante');
    int entrada = lerEntrada();
    if (entrada == 1) {
      print('Digite o preço:');
      preco = lerSaldo();
      print('Digite o número de parcelas:');
      parcelas = lerParcela();
      print('Digite o tipo do produto:');
      tipo = lerNome();
      clearConsole();
      Compra compra = Compra(preco, parcelas, tipo);
      verificarTipoObjeto(compra);
      print(
          'Escolha uma opção:\n(1) Pagar parcelas\n(2) Atualizar parcelas\n(3) Quitar compra\n(4) Cancelar compra');
      opcao = lerOpcao();
      menuCompra(opcao, compra);
    } else {
      print('Digite o preço:');
      preco = lerSaldo();
      print('Digite o número de parcelas:');
      parcelas = lerParcela();
      print('Digite o tipo do produto:');
      tipo = lerNome();
      clearConsole();
      ContaEstudante contaEstudante = ContaEstudante(preco, parcelas, tipo);
      verificarTipoObjeto(contaEstudante);
      print('Escolha uma opção:\n (1) Pagar parcelas\n (2) Quitar compra');
      opcao = lerOpcao();
      menuEstudante(opcao, contaEstudante);
    }
    continuar = lerContinuar()!;
    clearConsole();
  }
}

void verificarTipoObjeto(Object obj) {
  if (obj is ContaEstudante) {
    if (obj.parcelas > 0) {
      double precoComDesconto = obj.preco / 2;
      int parcelasComDesconto = obj.parcelas ~/ 2;
      obj.preco = precoComDesconto;
      obj.parcelas = parcelasComDesconto;
      print('Preço com desconto: ${precoComDesconto.toStringAsFixed(2)}');
      print('Total de parcelas com desconto: $parcelasComDesconto');
    } else {
      obj.quitarCompra();
      print('Preço com desconto: ${obj.preco}');
      print('Total de parcelas com desconto: ${obj.parcelas}');
    }
  } else if (obj is Compra) {
    double totalPreco = obj.preco * obj.parcelas;
    int totalParcelas = obj.parcelas;
    obj.preco = totalPreco;
    obj.parcelas = totalParcelas;
    print('Preço total: ${totalPreco.toStringAsFixed(2)}');
    print('Total de parcelas: $totalParcelas');
  }
}

void menuCompra(int entrada, Compra compra) {
  const int PARCELAS_ATUALIZADAS = 12;
  const double JUROS = 0.1;
  switch (entrada) {
    case 1:
      compra.pagarParcela();
      print('Parcelas restantes após pagamento: ${compra.parcelas}');
      print('Valor restante ${compra.preco} reais');
      break;
    case 2:
      compra.atualizarParcela(JUROS, PARCELAS_ATUALIZADAS);
      print('Preço atualizado: ${compra.preco}');
      print('Parcelas atualizadas: ${compra.parcelas}');
      break;
    case 3:
      compra.quitarCompra();
      print('Parcelas após quitar compra: ${compra.parcelas}');
      print('Valor restante ${compra.preco} reais');
      break;
    case 4:
      compra.cancelarCompra();
      print('Parcelas após cancelar compra: ${compra.parcelas}');
      print('Valor restante ${compra.preco} reais');
      break;
    default:
      print('Opção inválida!');
      break;
  }
}

void menuEstudante(int entrada, ContaEstudante contaEstudante) {
  switch (entrada) {
    case 1:
      contaEstudante.pagarParcela();
      print('Parcelas restantes após pagamento: ${contaEstudante.parcelas}');
      print('Valor restante ${contaEstudante.preco} reais');
      break;
    case 2:
      contaEstudante.quitarCompra();
      print('Parcelas após quitar conta: ${contaEstudante.parcelas}');
      print('Valor restante ${contaEstudante.preco} reais');
      break;
    default:
      print('Opção inválida!');
      break;
  }
}

int lerEntrada() {
  bool opcaoValida = false;
  int? opcao;
  while (!opcaoValida) {
    opcao = int.tryParse(stdin.readLineSync()!);
    if (opcao == 1) {
      opcaoValida = true;
      return 1;
    } else if (opcao == 2) {
      opcaoValida = true;
      return 2;
    } else {
      print('Entrada inválida! Digite (1) Compra ou (2) Conta de Estudante:');
    }
  }
  return 0;
}

double lerSaldo() {
  bool dadosValido = false;
  double? saldo;
  while (!dadosValido) {
    saldo = double.tryParse(stdin.readLineSync()!);
    if (saldo != null && saldo > 0) {
      dadosValido = true;
    } else {
      print('Valor inválido! Digite novamente:');
    }
  }
  return saldo!;
}

bool nomeValido(String nome) {
  RegExp regex = RegExp(r'^[A-Za-z0-9]+( [A-Za-z0-9]+)*$');
  return regex.hasMatch(nome);
}

String lerNome() {
  bool dadosValido = false;
  String? nome;
  while (!dadosValido) {
    nome = stdin.readLineSync()!;
    if (nomeValido(nome)) {
      dadosValido = true;
    } else {
      print('Nome inválido! Digite novamente:');
    }
  }
  return nome!;
}

int lerParcela() {
  int? parcela;
  bool dadosValido = false;
  while (!dadosValido) {
    parcela = int.tryParse(stdin.readLineSync()!);
    if (parcela != null && parcela > 0) {
      dadosValido = true;
    } else {
      print('Parcela inválida! Digite novamente:');
    }
  }
  return parcela!;
}

int lerOpcao() {
  int? opcao;
  bool dadosValido = false;
  while (!dadosValido) {
    opcao = int.tryParse(stdin.readLineSync()!);
    if (opcao != null && opcao > 0 && opcao <= 4) {
      dadosValido = true;
    } else {
      print('Parcela inválida! Digite novamente:');
    }
  }
  return opcao!;
}

bool? lerContinuar() {
  bool opcaoValida = false;
  while (!opcaoValida) {
    print('Deseja fazer novamente? (S para sim, N para não)');
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
