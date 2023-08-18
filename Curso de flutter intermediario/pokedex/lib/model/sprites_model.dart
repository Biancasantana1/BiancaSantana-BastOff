class Sprites {
  Sprites({
    required this.officialArtwork,
  });
  late final String officialArtwork;

  Sprites.fromJson(Map<String, dynamic> json) {
    officialArtwork = json['other']['official-artwork']['front_default'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['other'] = {
      'official-artwork': {'front_default': officialArtwork}
    };
    return data;
  }
}
