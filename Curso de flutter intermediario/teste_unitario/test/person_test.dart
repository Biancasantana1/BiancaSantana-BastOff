import 'package:flutter_test/flutter_test.dart';
import 'package:teste_unitario/person.dart';

void main() {
  final person =
      Person(id: '12', name: 'Bianca', age: 23, height: 1.60, weight: 59.90);

  test('teste imc', () {
    expect(person.imc, 23.4);
  });
  group('isOlder | ', () {
    test('Se idade for maior que 18, então isOlder deve ser true', () {
      expect(person.isOlder, true);
    });

    test('Se idade for igual que 18, então isOlder deve ser true', () {
      final person =
          Person(id: '12', name: 'Maria', age: 18, height: 1.60, weight: 59.90);
      expect(person.isOlder, true);
    });
  });
}
