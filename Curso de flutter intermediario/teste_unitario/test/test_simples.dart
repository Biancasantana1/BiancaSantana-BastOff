@Timeout(Duration(seconds: 60))
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('is Worked', () {
    const name = "Bianca";
    expect(
        name,
        allOf([
          isA<String>(),
          equals('Bianca'),
          isNotNull,
          contains('ia'),
        ]));
  });

  test('throw error', () {
    expect(() => int.parse('x'), throwsException);
  }, tags: 'web');
}
