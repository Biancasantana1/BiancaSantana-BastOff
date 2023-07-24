class Veterinarian {
  final String imagePath;
  final String name;
  final String specialty;
  final String distance;
  final String rating;
  final String icon1Path;
  final String icon2Path;
  final String address;
  final String phoneNumber;
  final List<String> availableHours;

  Veterinarian({
    required this.imagePath,
    required this.name,
    required this.specialty,
    required this.distance,
    required this.rating,
    required this.icon1Path,
    required this.icon2Path,
    required this.address,
    required this.phoneNumber,
    required this.availableHours,
  });
}
