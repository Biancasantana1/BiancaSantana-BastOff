/*Uma empresa precisa montar uma aplicação em Dart para gerenciar o pagamento de seus funcionários.
 Todo funcionário possui um nome (string), cpf (string), salário (double) e um método para calcular
  a bonificação. Implemente a classe funcionário com os atributos acima.
________________________________________________________________________________________
10.1. Herança: Um gerente possui atributos privados, sendo: senhaEspecial (double) 
e quantidade de funcionários (int), sendo que todo gerente é um funcionário.
________________________________________________________________________________________
10.2. Herança: Um engenheiro possui os atributos privados como o crea (string), 
categoria (string) e projetoAtual(String), sendo que todo engenheiro é um funcionário também. 
Usando o conceito de herança, implemente as classes para gerente e engenheiro conforme os itens10.1 e 10.2.
________________________________________________________________________________________
10.3. Polimorfismo: Todos os funcionários devem ter um método para adicionar bonificação,
adicionarBonificacao(Funcionario funcionário), que deve bonificar um engenheiro em 5% do salário 
e se for um gerente, bonificar com 10% do salário.*/
import 'Funcionario.dart';
import 'Engenheiro.dart';
import 'Gerente.dart';
import '../Tarefa 2 - String.dart';
import 'dart:io';

void main() {
  String nome;
  String cpf;
  double salario;
  bool continuar = true;
  while (continuar) {
    print('******** Sistema de Funcionários ******** ');
    print(
        'Qual é o tipo do funcionário? \n (1) Funcionário \n (2) Gerente \n (3) Engenheiro');
    int entrada = lerEntrada();
    if (entrada == 1) {
      print('Digite o nome do funcionário:');
      nome = lerNome();
      print('Digite o CPF no formato xxx.xxx.xxx-xx :');
      cpf = lerCpf();
      print('Digite o salário:');
      salario = lerSalario();
      clearConsole();
      Funcionario funcionario = Funcionario(nome, cpf, salario);
      funcionario.adicionarBonificacao(funcionario);
    } else if (entrada == 2) {
      print('Digite o nome do gerente:');
      nome = lerNome();
      print('Digite o CPF no formato xxx.xxx.xxx-xx :');
      cpf = lerCpf();
      print('Digite o salário:');
      salario = lerSalario();
      print('Digite a senha (4 digitos):');
      String senha = lerSenhaEspecial();
      print('Digite a quantidade de funcionários:');
      int quantidadeFuncionario = lerQuantidadeFuncionario();
      clearConsole();
      Gerente gerente =
          Gerente(nome, cpf, salario, senha, quantidadeFuncionario);

      gerente.adicionarBonificacao(gerente);
    } else {
      print('Digite o nome do engenheiro:');
      nome = lerNome();
      print('Digite o CPF no formato xxx.xxx.xxx-xx :');
      cpf = lerCpf();
      print('Digite o salário:');
      salario = lerSalario();
      print('Digite o número do CREA no formato XX.XXXXXX/D : ');
      String crea = lerCrea();
      print('Digite a categoria do engenheiro:');
      String categoria = lerCategoria();
      print('Digite o projeto atual do engenheiro:');
      String projetoAtual = lerProjeto();

      clearConsole();
      Engenheiro engenheiro =
          Engenheiro(nome, cpf, salario, crea, categoria, projetoAtual);

      engenheiro.adicionarBonificacao(engenheiro);
    }

    continuar = lerContinuar()!;
    clearConsole();
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
    } else if (opcao == 3) {
      opcaoValida = true;
      return 3;
    } else {
      print(
          'Entrada inválida! Digite (1) Funcionário ou (2) Gerente ou (3) Engenheiro:');
    }
  }
  return 0;
}

double lerSalario() {
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
  RegExp regex = RegExp(r'^[A-Za-z]+( [A-Za-z]+)*$');
  return regex.hasMatch(nome);
}

bool senhaEspecialValida(String senha) {
  RegExp regex = RegExp(r'^\d{4}$');
  return regex.hasMatch(senha);
}

String lerSenhaEspecial() {
  bool dadosValido = false;
  String? senha;
  while (!dadosValido) {
    senha = stdin.readLineSync()!;
    if (senhaEspecialValida(senha)) {
      dadosValido = true;
    } else {
      print('Senha inválida! Digite novamente:');
    }
  }
  return senha!;
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

String lerCpf() {
  bool dadosValido = false;
  String? cpf;
  while (!dadosValido) {
    cpf = stdin.readLineSync()!;
    if (cpfFormatoValido(cpf)) {
      dadosValido = true;
    } else {
      print('Número de CPF inválido! Digite novamente:');
    }
  }
  return cpf!;
}

String lerCrea() {
  bool dadosValidos = false;
  String? crea;

  while (!dadosValidos) {
    crea = stdin.readLineSync();
    if (creaFormatoValido(crea!)) {
      dadosValidos = true;
    } else {
      print('Número de CREA inválido! Digite novamente:');
    }
  }

  return crea!;
}

bool creaFormatoValido(String crea) {
  final RegExp regexCreaSP = RegExp(r'^\d{2}\.\d{6}\/\d{1}$');
  return regexCreaSP.hasMatch(crea);
}

int lerQuantidadeFuncionario() {
  int? qtdFuncionario;
  bool dadosValido = false;
  while (!dadosValido) {
    qtdFuncionario = int.tryParse(stdin.readLineSync()!);
    if (qtdFuncionario != null && qtdFuncionario > 0) {
      dadosValido = true;
    } else {
      print('Quantidade de funcionário inválida! Digite novamente:');
    }
  }
  return qtdFuncionario!;
}

String lerCategoria() {
  bool dadosValidos = false;
  String? categoria;
  while (!dadosValidos) {
    categoria = stdin.readLineSync();
    if (nomeValido(categoria!)) {
      dadosValidos = true;
    } else {
      print('Categoria inválida! Digite novamente:');
    }
  }
  return categoria!;
}

String lerProjeto() {
  bool dadosValidos = false;
  String? projeto;
  while (!dadosValidos) {
    projeto = stdin.readLineSync();
    if (nomeValido(projeto!)) {
      dadosValidos = true;
    } else {
      print('Projeto inválido! Digite novamente:');
    }
  }
  return projeto!;
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
