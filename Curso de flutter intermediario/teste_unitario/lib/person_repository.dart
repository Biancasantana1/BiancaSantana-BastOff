import 'dart:convert';

import 'package:http/http.dart';
import 'package:teste_unitario/person.dart';

class PersonRepository {
  final Client client = Client();
  Future<List<Person>> getPerson() async {
    final response = await client.get(
        Uri.parse('https://5ecafaf138df960016511b4c.mockapi.io/api/v1/person'));

    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body) as List;
      return jsonList.map((e) => Person.fromMap(e)).toList();
    } else {
      throw Exception('Erro na internet');
    }
  }
}
