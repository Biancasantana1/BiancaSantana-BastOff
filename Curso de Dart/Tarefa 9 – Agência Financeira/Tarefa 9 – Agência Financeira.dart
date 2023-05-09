/*Uma Agência Financeira possui clientes como pessoa física e pessoa jurídica. 
Esta precisa de um sistema para gerenciar os contratos de financiamento com seus clientes. 
Os contratos possuem número, nome do contratante, valor do contrato e prazo.
Crie uma classe contrato com os atributos número (int), contratante (string), valor (double) e prazo (int).

______________________________________________________________________
9.1. Herança: Os contratos podem ser contrato de pessoa física e contrato de pessoa jurídica. 
Os contratos de pessoa física também tem o CPF e a idade do contratante. 
Os contratos de pessoa jurídica possuem o CNPJ e a inscrição estadual da empresa contratante.
 Usando o conceito de herança, crie a classe ContratoPessoaFisica herdando da classe Contrato e 
 com os atributos adicionais do Contrato Pessoa Física. Em seguida, crie a classe ContratoPessoaJuridica 
 herdando da classe Contrato e com os atributos adicionais do Contrato Pessoa Jurídica.
Implemente as classes necessárias para representar os diferentes contratos da Agência Financeira.
________________________________________________________________
9.2. Sobrescrita de Método: O valor da prestação de um contrato é calculado por um método 
calcularPrestação(), como sendo o valor do contrato dividido pelo prazo. Este método calcularPrestação() 
existe para todos os Contratos. Entretanto, para os contratos de pessoa jurídica existe um adicional
 de 3 reais no valor de cada prestação e para os contratos de pessoa física o valor da prestação também 
 tem um adicional no valor da prestação que deve ser calculado de acordo com a idade do contratante:
idade <= 30 tem adicional de 1,00
idade <= 40 tem adicional de 2,00
idade <= 50 tem adicional de 3,00
idade > 50 tem adicional de 4,00


Implemente o método calcularPrestacao() na(s) classe(s) necessárias.
______________________________________________________________________

9.3. Mais métodos: Todos os contratos devem ter um método exibirInfo() (que não retorna valor 
e que não tem parâmetros) para informar o valor do contrato, o prazo e o valor da prestação. 
Além disso, os contratos de pessoa física devem informar também a idade do contratante.

______________________________________________________________________

9.4. Polimorfismo: Refaça o exercício 9.2 criando um método calcularPrestação() que recebe como 
parâmetro um objeto da classe Contrato. Este método deve ser polimórfico e dependendo da classe 
do objeto o método deve calcular o valor da prestação */
import 'ContratoPessoaFisica.dart';
import '../Tarefa 2 - String.dart';
import 'ContratoPessoaJuridica.dart';
import 'dart:io';

void main() {
  int numeroContrato;
  String nome;
  double valor;
  int prazo;
  bool continuar = true;

  while (continuar) {
    print('******** Sistema de Agência Financeira ******** ');

    print("Inicie um contrato: \n (1) Pessoa física \n (2) Pessoa jurídica");
    int entrada = lerEntrada();
    clearConsole();
    if (entrada == 1) {
      print("Digite o número do contrato:");
      numeroContrato = lerNumeroContrato();
      print("Digite o nome do contratante:");
      nome = lerNome();
      print("Digite o valor:");
      valor = lerSaldo();
      print("Digite o prazo:");
      prazo = lerPrazo();
      print("Digite o CPF no formato xxx.xxx.xxx-xx :");
      String cpf = lerCpf();
      print("Digite a idade (acima de 18 anos):");
      int idade = lerIdade();
      ContratoPessoaFisica contratoPF =
          ContratoPessoaFisica(numeroContrato, nome, valor, prazo, cpf, idade);
      clearConsole();
      print("Contrato Pessoa Física:");
      contratoPF.exibirInfo();
    } else {
      print("Digite o número do contrato:");
      numeroContrato = lerNumeroContrato();
      print("Digite o nome do contratante:");
      nome = lerNome();
      print("Digite o valor:");
      valor = lerSaldo();
      print("Digite o prazo:");
      prazo = lerPrazo();
      print("Digite o CNPJ no formato (XX.XXX.XXX/XXXX-XX):");
      String cnpj = lerCnpj();
      print(
          "Digite a inscricao estadual para o estado de São Paulo no formato xxx.xxx.xxx.xxx:");
      String inscEstadual = lerInscricaoEstadual();
      ContratoPessoaJuridica contratoPJ = ContratoPessoaJuridica(
          numeroContrato, nome, valor, prazo, cnpj, inscEstadual);
      clearConsole();
      print("\nContrato Pessoa Jurídica:");
      contratoPJ.exibirInfo();
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
    } else {
      print(
          'Entrada inválida! Digite (1) Pessoa física ou (2) Pessoa jurídica:');
    }
  }
  return 0;
}

int lerNumeroContrato() {
  int? numContrato;
  bool dadosValido = false;
  while (!dadosValido) {
    numContrato = int.tryParse(stdin.readLineSync()!);
    if (numContrato != null && numContrato > 0) {
      dadosValido = true;
    } else {
      print('Número do contrato inválido! Digite novamente:');
    }
  }
  return numContrato!;
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
  RegExp regex = RegExp(r'^[A-Za-z]+( [A-Za-z]+)*$');
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

int lerPrazo() {
  int? prazo;
  bool dadosValido = false;
  while (!dadosValido) {
    prazo = int.tryParse(stdin.readLineSync()!);
    if (prazo != null && prazo > 0) {
      dadosValido = true;
    } else {
      print('Prazo inválido! Digite novamente:');
    }
  }
  return prazo!;
}

int lerIdade() {
  int? idade;
  bool dadosValido = false;
  while (!dadosValido) {
    idade = int.tryParse(stdin.readLineSync()!);
    if (idade != null && idade >= 18) {
      dadosValido = true;
    } else {
      print('Idade inválido! Digite novamente(acima de 18 anos):');
    }
  }
  return idade!;
}

String lerCnpj() {
  bool dadosValido = false;
  String? cnpj;
  while (!dadosValido) {
    cnpj = stdin.readLineSync()!;
    if (cnpjFormatoValido(cnpj)) {
      dadosValido = true;
    } else {
      print('Número de CNPJ inválido! Digite novamente:');
    }
  }
  return cnpj!;
}

bool cnpjFormatoValido(String cnpj) {
  RegExp regex = RegExp(r'^\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}$');
  if (!regex.hasMatch(cnpj)) {
    return false;
  }
  cnpj = cnpj.replaceAll(".", "").replaceAll("-", "").replaceAll("/", "");

  if (RegExp(r'^(\d)\1{13}$').hasMatch(cnpj)) return false;

  List<int> digitos = cnpj.split('').map((d) => int.parse(d)).toList();
  int digito1 = calcularDigitoVerificadorCNPJ(digitos.sublist(0, 12));
  int digito2 =
      calcularDigitoVerificadorCNPJ(digitos.sublist(0, 12) + [digito1]);

  return digitos[12] == digito1 && digitos[13] == digito2;
}

int calcularDigitoVerificadorCNPJ(List<int> digitos) {
  List<int> pesos;

  if (digitos.length == 12) {
    pesos = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
  } else {
    pesos = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
  }

  int soma = 0;
  for (int i = 0; i < digitos.length; i++) {
    soma += digitos[i] * pesos[i];
  }
  int resto = soma % 11;

  if (resto < 2) {
    return 0;
  } else {
    return 11 - resto;
  }
}

String lerInscricaoEstadual() {
  bool dadosValido = false;
  String? inscEstadual;
  while (!dadosValido) {
    inscEstadual = stdin.readLineSync()!;
    if (inscricaoEstadualSPValida(inscEstadual)) {
      dadosValido = true;
    } else {
      print('Inscricao estadual inválida! Digite novamente:');
    }
  }
  return inscEstadual!;
}

bool inscricaoEstadualSPValida(String inscricao) {
  RegExp regex = RegExp(r'^\d{3}\.\d{3}\.\d{3}\.\d{3}$');
  if (regex.hasMatch(inscricao)) {
    return true;
  }
  return false;
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
