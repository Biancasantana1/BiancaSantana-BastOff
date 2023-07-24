import 'package:veterinario/utils/assets_images_utils.dart';

import '../model/veterinarian_model.dart';

class VeterinarianDataMock {
  static List<Veterinarian> getVeterinarians() {
    return [
      Veterinarian(
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
      ),
      Veterinarian(
        imagePath: AssetsImg.secondPicture,
        name: 'Dr. Sheila',
        specialty: 'Consultation, SPA & Treatment',
        distance: '3km',
        rating: 'Available for',
        icon1Path: AssetsImg.cat,
        icon2Path: AssetsImg.dog,
        address: 'Avenida Paulista, 987',
        phoneNumber: '+55 11 98765-4321',
        availableHours: ['09:00', '11:00', '14:00', '16:00'],
      ),
      Veterinarian(
        imagePath: AssetsImg.firstPicture,
        name: 'Dr. Vanessa',
        specialty: 'Vaccine, Surgery, SPA & Treatment',
        distance: '5km',
        rating: 'Available for',
        icon1Path: AssetsImg.cat,
        icon2Path: AssetsImg.dog,
        address: 'Alameda Santos, 456',
        phoneNumber: '+55 11 2468-1357',
        availableHours: ['10:00', '11:00', '14:00', '15:00', '16:00'],
      ),
    ];
  }
}
