import 'dart:io';

void main() {
  // 1 - Introdução a Variaveis

  String variavelNome = "Bianca";
  print(variavelNome);
  int valorVariavel = 10;
  print(valorVariavel);
  bool ehVerdadeiro = true;
  print(ehVerdadeiro);
  List<String> listaDePalavras = ["bianca", "santana"];
  print('${listaDePalavras[0]} - ${listaDePalavras[1]} ');

  // 2 - Introdução null-safety

  String? letras;
  letras = 'ABC';
  print(letras);

  late String sobrenome;
  sobrenome = 'Santana';
  print(sobrenome);

  // 3 - IF e SWITCH

  bool seguirEmFrente = false;

  if (seguirEmFrente)
    print('Andar');
  else
    print('Parar');

  if (10 > 5) {
    print("10 é maior que 5");
  }

  int valorInt = 2;
  switch (valorInt) {
    case 0:
      print('ZERO');
      break;
    case 1:
      print('UM');
      break;
    case 2:
      print('DOIS');
      break;
    default:
      print('PADRAO');
  }

  // 4 - Estruturas de repetição

  for (int i = 1; i <= 10; i++) {
    print(i * 2);
  }

  int contador = 10;
  while (contador != 1) {
    contador = contador - 1;
    print('Loop -> $contador ');
  }

  // 5 - Metodos e classes

  Celular celularDaBianca = Celular("Amarelo", 5, 0.3, 6.0);
  Celular celularDoTarcio = Celular("Cinza", 10, 0.5, 6.0);
  print(celularDaBianca.toString());
  print(celularDoTarcio.valorDoCelular(1000));

  // 6 - Orientação a objetos

  Carro mercedes = Carro("Mercedes");
  Carro gol = Carro("Gol");

  // 7 - Herança, Polimorfismo e Abstração

  Bianca bianca = Bianca();
  bianca.falar();
  // Mixin
  bianca.falarVo();

  Pagamento pagamento = PagarComBoleto();
  pagamento.pagar();

  pagamento = PagarComPix();
  pagamento.pagar();

  // 8 - Future, Async e Await

  String nome = 'bianca';
  late String cep;

  Future<String> cepFuture = getCepByName("Rua JK");
  cepFuture.then((result) => cep = result);
  //cep = await cepFuture;
  print(cep);
}

// interface
abstract class Pessoa {
  String comunicar();
}

class PessoaEt implements Pessoa {
  String comunicar() {
    return "Ola mundo";
  }
}

// herança
class Pai {
  String falar() {
    return "giria";
  }
}

// mixin
mixin Avo {
  void falarVo() {
    print("Vovo");
  }
}

class Bianca extends Pai with Avo {}

//polimorfismo
abstract class Pagamento {
  void pagar();
}

class PagarComBoleto implements Pagamento {
  void pagar() {
    print("pagando com boleto");
  }
}

class PagarComPix implements Pagamento {
  void pagar() {
    print("pagando com pix");
  }
}

// classes e metodos
class Carro {
  final String modelo;
  String _segredo = "muito dinheiro";
  int _valor = 1000;

  int get valorCarro => _valor;
  void setValue(int valor) => _valor = valor;
  Carro(this.modelo);
}

class Celular {
  final String cor;
  final int qtdPros;
  final double tamanho;
  final double peso;

  Celular(this.cor, this.qtdPros, this.tamanho, this.peso);

  @override
  String toString() {
    return 'Cor $cor, qtdPross $qtdPros, tamanho $tamanho, peso $peso';
  }

  double valorDoCelular(double valor) {
    return valor * qtdPros;
  }
}

// external service
Future<String> getCepByName(String nome) {
  //simulando requisição
  return Future.value("09090-999");
}
