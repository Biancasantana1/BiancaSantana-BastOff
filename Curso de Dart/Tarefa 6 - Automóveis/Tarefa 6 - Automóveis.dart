/* Um automóvel possui as informações de placa (String), modelo (String), combustível (int), 
cor (String) e ano (int). O Atributo combustível pode ter um dos valores abaixo:
GASOLINA = 1
ALCOOL = 2
DIESEL = 3
GAS = 4 

Estes valores devem ser declarados na classe como sendo constantes na classe.

Além disso, todo automóvel possui um método que calcula quanto custa com base 
no combustível que o automóvel utiliza conforme abaixo: 

GASOLINA custa 12.000,00
ALCOOL custa 10.500,00
DIESEL custa 11.000,00
GAS custa 13.000,00
Um Automóvel de Luxo possui as mesmas informações de um Automóvel, porém também
pode ter direção hidráulica,ar-condicionado e vidros elétricos.
Além disso o Automóvel de Luxo possui computador de bordo e por isso pode estacionar sozinho.

O automóvel de luxo possui um método que calcula o custo com base no combustível utilizado 
somado com o valor dos acessórios abaixo:
Ar-condicionado = 2.000,00
Direção Hidráulica = 1.500,00
Vidro elétrico = 800,00

➢ Implemente uma hierarquia de classes para representar Automóvel e Automóvel de Luxo;
➢ Implemente um programa em Dart que crie objetos da classe Automóvel e da classe Automóvel de Luxo.  */
import 'Automovel.dart';
import 'AutomovelDeLuxo.dart';
import 'dart:io';

void main() {
  bool continuar = true;

  while (continuar) {
    print('******** Sistema de Automovel ******** ');
    String placa = lerPlaca();
    clearConsole();
    String modelo = lerModelo();
    clearConsole();
    print(
        "Tipo de Combustível: \n (1) GASOLINA \n (2) ALCOOL \n (3) DIESEL \n (4) GÁS");
    int tipoCombustivel = combustivel(lerTipoCombustivel());
    clearConsole();
    String cor = lerCor();
    clearConsole();
    print("Digite o ano (4 digitos):");
    int ano = lerAno();
    clearConsole();
    print("Seu veiculo é automóvel de luxo: \n (1) Sim \n (2) Não");
    int automovelLuxo = lerAutomovelLuxo();
    clearConsole();
    if (automovelLuxo == 1) {
      print("Tem arcondicionado: (1) Sim (2) Não");
      bool arcondicionado = lerEntrada()!;
      clearConsole();
      print("Tem direção hidraulica: (1) Sim (2) Não");
      bool direcaoHidraulica = lerEntrada()!;
      clearConsole();
      print("Tem vidro eletrico: (1) Sim (2) Não");
      bool vidroEletrico = lerEntrada()!;
      clearConsole();
      AutomovelDeLuxo carroLuxo = AutomovelDeLuxo(
          placa, modelo, tipoCombustivel, cor, ano,
          arCondicionado: arcondicionado,
          direcaoHidraulica: direcaoHidraulica,
          vidroEletrico: vidroEletrico);
      double custoCarroLuxo = carroLuxo.calcularCusto();
      print("Custo do carro de luxo: $custoCarroLuxo");
    } else {
      Automovel carro = Automovel(placa, modelo, tipoCombustivel, cor, ano);
      double custoCarro = carro.calcularCusto();
      print("Custo do carro: $custoCarro");
    }
    continuar = lerContinuar()!;
    clearConsole();
  }
}

int combustivel(int entrada) {
  switch (entrada) {
    case 1:
      return Automovel.GASOLINA;
    case 2:
      return Automovel.ALCOOL;
    case 3:
      return Automovel.DIESEL;
    case 4:
      return Automovel.GAS;
    default:
      return 0;
  }
}

String lerPlaca() {
  String placa;
  do {
    print("Digite a placa do carro (formato: ABC1234): ");
    placa = stdin.readLineSync()!.toUpperCase();
  } while (!validarPlaca(placa));
  return placa;
}

String lerCor() {
  String cor;
  do {
    print("Digite a cor do carro: ");
    cor = stdin.readLineSync()!.toLowerCase();
  } while (!validarCor(cor));
  return cor;
}

String lerModelo() {
  String modelo;
  do {
    print("Digite o modelo do carro: ");
    modelo = stdin.readLineSync()!.toLowerCase();
  } while (!validarModelo(modelo));
  return modelo;
}

int lerTipoCombustivel() {
  bool dadosValido = false;
  int? tipoCombustivel;
  while (!dadosValido) {
    tipoCombustivel = int.tryParse(stdin.readLineSync()!);
    if (tipoCombustivel != null &&
        tipoCombustivel > 0 &&
        tipoCombustivel <= 4) {
      dadosValido = true;
    } else {
      print('Tipo de combustível inválido! Digite novamente:');
    }
  }
  return tipoCombustivel!;
}

int lerAutomovelLuxo() {
  bool dadosValido = false;
  int? automovelLuxo;
  while (!dadosValido) {
    automovelLuxo = int.tryParse(stdin.readLineSync()!);
    if (automovelLuxo != null && automovelLuxo > 0 && automovelLuxo <= 2) {
      dadosValido = true;
    } else {
      print('Entrada inválida! Digite novamente:');
    }
  }
  return automovelLuxo!;
}

int lerAno() {
  bool dadosValido = false;
  int? ano;
  while (!dadosValido) {
    ano = int.tryParse(stdin.readLineSync()!);
    if (ano != null && ano >= 1000 && ano <= 9999) {
      dadosValido = true;
    } else {
      print('Ano inválido! Digite novamente(4 digitos):');
    }
  }
  return ano!;
}

bool? lerEntrada() {
  bool opcaoValida = false;
  int? opcao;
  while (!opcaoValida) {
    opcao = int.tryParse(stdin.readLineSync()!);
    if (opcao == 1) {
      opcaoValida = true;
      return true;
    } else if (opcao == 2) {
      opcaoValida = true;
      return false;
    } else {
      print('Entrada inválida! Digite 1 para sim ou 2 para não.');
    }
  }
}

bool validarPlaca(String placa) {
  RegExp regex = RegExp(r'^[A-Z]{3}[0-9]{4}$');
  return regex.hasMatch(placa);
}

bool validarCor(String cor) {
  List<String> coresValidas = [
    'preto',
    'branco',
    'vermelho',
    'azul',
    'verde',
    'cinza',
    'prata',
    'amarelo'
  ];
  return coresValidas.contains(cor);
}

bool validarModelo(String modelo) {
  List<String> modelosValidos = [
    'fusca',
    'gol',
    'palio',
    'civic',
    'corolla',
    'audi'
  ];
  return modelosValidos.contains(modelo);
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
