import 'package:flutter_test/flutter_test.dart';
import 'package:teste_unitario/person.dart';
import 'package:teste_unitario/person_repository.dart';

void main() {
  final repository = PersonRepository();
  test('Deve pegar uma lista de person', () async {
    // teste não funcionado porque a api está dando erro 400
    final list = await repository.getPerson();
    expect(list.isEmpty, equals(true));
  });
}
