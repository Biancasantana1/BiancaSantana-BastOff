import 'package:flutter/widgets.dart';
import '../mock/veterinarian_data_mock.dart';
import '../model/veterinarian_model.dart';

class FilterController extends ChangeNotifier {
  List<Veterinarian> veterinarians = VeterinarianDataMock.getVeterinarians();
  List<Veterinarian> displayedVeterinarians = [];
  String searchText = '';
  String selectedSpecialty = '';

  FilterController() {
    filterVeterinarians();
  }

  void onSearch(String searchText) {
    this.searchText = searchText;
    filterVeterinarians();
  }

  void onSelectedSpecialty(String specialty) {
    selectedSpecialty = specialty;
    filterVeterinarians();
  }

  void filterVeterinarians() {
    if (searchText.isEmpty && selectedSpecialty.isEmpty) {
      displayedVeterinarians = veterinarians;
    } else {
      displayedVeterinarians = veterinarians.where((veterinarian) {
        List<String> specialties =
            veterinarian.specialty.split(', ').map((s) => s.trim()).toList();
        return (searchText.isEmpty ||
                veterinarian.specialty
                    .toLowerCase()
                    .contains(searchText.toLowerCase())) &&
            (selectedSpecialty.isEmpty ||
                specialties.contains(selectedSpecialty));
      }).toList();
    }

    notifyListeners();
  }
}
