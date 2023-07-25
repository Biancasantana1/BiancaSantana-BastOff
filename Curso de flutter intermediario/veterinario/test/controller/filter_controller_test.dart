import 'package:flutter_test/flutter_test.dart';
import 'package:veterinario/controller/filter_controller.dart';

void main() {
  group('FilterController', () {
    test('alterações de texto de pesquisa exibidasVeterinários', () {
      final controller = FilterController();
      final initialLength = controller.displayedVeterinarians.length;

      controller.onSearch('John');
      expect(controller.displayedVeterinarians.length,
          isNot(equals(initialLength)));
    });

    test('alterações de especialidade selecionadas exibidasVeterinários', () {
      final controller = FilterController();
      final initialLength = controller.displayedVeterinarians.length;

      controller.onSelectedSpecialty('Dentistry');
      expect(controller.displayedVeterinarians.length,
          isNot(equals(initialLength)));
    });
  });
}
