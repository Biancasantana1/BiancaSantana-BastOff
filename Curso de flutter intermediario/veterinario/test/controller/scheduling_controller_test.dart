import 'package:flutter_test/flutter_test.dart';
import 'package:veterinario/controller/scheduling_controller.dart';
import 'package:veterinario/model/scheduling_model.dart';
import 'package:veterinario/model/veterinarian_model.dart';
import 'package:veterinario/utils/assets_images_utils.dart';

void main() {
  final controller = SchedulingController();
  final veterinarian = Veterinarian(
    imagePath: AssetsImg.firstPicture,
    name: 'Dr. Stone',
    specialty: 'Vaccine, Surgery',
    distance: '10km',
    rating: 'Available for',
    icon1Path: AssetsImg.cat,
    icon2Path: AssetsImg.dog,
    address: 'Rua das Pedras, 123',
    phoneNumber: '+55 11 12345-6789',
    availableHours: ['09:00', '10:00', '11:00', '14:00', '15:00'],
  );
  final scheduling1 = Scheduling(
    veterinarian: veterinarian,
    selectedDate: '2023-07-24',
    selectedTime: '12:00',
  );
  final scheduling2 = Scheduling(
    veterinarian: veterinarian,
    selectedDate: '2023-07-25',
    selectedTime: '12:00',
  );
  group('SchedulingController', () {
    test('Deve adicionar um agendamento', () {
      controller.addScheduling(scheduling1);
      expect(controller.schedules.length, 1);
      expect(controller.schedules[0], scheduling1);
    });

    test('Deve remover um agendamento', () {
      controller.removeScheduling(0);
      expect(controller.schedules.length, 0);
    });

    test('Deve obter o próximo cronograma', () {
      controller.addScheduling(scheduling1);
      controller.addScheduling(scheduling2);
      expect(controller.getNextSchedule(), scheduling1);
    });

    test('Deve confirmar todos os horários', () {
      controller.confirmAllSchedules();
      expect(controller.confirmedAppointments.length, 2);
      expect(controller.schedules.length, 0);
    });

    test('Should cancel appointment', () {
      controller.cancelAppointment(0);
      expect(controller.confirmedAppointments.length, 1);
    });
  });
}
