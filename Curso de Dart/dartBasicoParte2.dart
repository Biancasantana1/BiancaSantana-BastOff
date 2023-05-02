import 'dart:convert';
import 'dart:io';

void main() {
  //Lista
  List<String> lista = ['Bianca', 'Tarcio'];
  print(lista[0]);

  // 9 - Maps

  Map<String, String> mapa = {'chave': 'valor'};
  print(mapa['chave']);

  mapa.putIfAbsent('novaChave', () => 'novoValor');
  print(mapa);

  mapa.remove('novaChave');
  mapa.keys.forEach(print);

  // 10 - JSON

  String json = '''
  {
    "usuario": "joana@gmail.com",
    "senha": 123
  }
  ''';
  var resultJson = jsonDecode(json);
  print(resultJson["usuario"]);

  Map mapa1 = {
    'nome': 'bia',
    'pass': 123,
    'permissoes': ['owner', 'admin']
  };

  var result = jsonEncode(mapa1);
  print(result);

  // 11 - Callable interface

  BuscarAlunos buscarAlunos = BuscarAlunos();
  buscarAlunos();

  // 12 - Tratamento de erros: Exceptions
  try {
    print((2 / 0));
  } catch (e, stackStrace) {
    // captura a falha
    print(stackStrace);
    //   rethrow; // propagar o erro para frente
    //throw Exception("Ocorreu o erro xpto"); // retorna um novo erro
    throw CustomError('Erro customizado');
  }
}

class BuscarAlunos {
  void call() => print('joelma, luna'); //callable interface
}

class CustomError implements Exception {
  final String error;
  CustomError(this.error);
}
