class Sprites {
  Sprites({
    required this.frontDefault,
  });
  late final String frontDefault;

  Sprites.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['front_default'] = frontDefault;
    return data;
  }
}
