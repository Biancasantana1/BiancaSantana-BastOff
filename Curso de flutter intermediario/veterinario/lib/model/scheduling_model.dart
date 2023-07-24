import 'package:veterinario/model/veterinarian_model.dart';

class Scheduling {
  final Veterinarian veterinarian;
  final String selectedDate;
  final String selectedTime;

  Scheduling({
    required this.veterinarian,
    required this.selectedDate,
    required this.selectedTime,
  });
}
