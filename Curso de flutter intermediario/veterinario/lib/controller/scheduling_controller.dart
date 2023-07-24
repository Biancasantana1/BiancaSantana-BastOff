import 'package:flutter/widgets.dart';
import '../model/scheduling_model.dart';

class SchedulingController extends ChangeNotifier {
  List<Scheduling> schedules = [];
  List<Scheduling> confirmedAppointments = [];

  void addScheduling(Scheduling scheduling) {
    schedules.add(scheduling);
    notifyListeners();
  }

  void removeScheduling(int index) {
    schedules.removeAt(index);
    notifyListeners();
  }

  Scheduling? getNextSchedule() {
    if (schedules.isNotEmpty) {
      schedules.sort((a, b) => a.selectedDate.compareTo(b.selectedDate));
      return schedules.first;
    } else {
      return null;
    }
  }

  void confirmAllSchedules() {
    confirmedAppointments.addAll(schedules);
    schedules.clear();
    notifyListeners();
  }

  void cancelAppointment(int index) {
    confirmedAppointments.removeAt(index);
    notifyListeners();
  }
}
