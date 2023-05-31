import 'movie_model.dart';

class Collection {
  late int id;
  late String name;
  late String overview;
  late String posterPath;
  late String backdropPath;
  late List<Movie> parts;

  Collection(
      {required this.id,
      required this.name,
      required this.overview,
      required this.posterPath,
      required this.backdropPath,
      required this.parts});

  Collection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
    parts = List<Movie>.from(json['parts'].map((x) => Movie.fromJson(x)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['backdrop_path'] = backdropPath;
    data['parts'] = parts.map((v) => v.toJson()).toList();
    return data;
  }

  @override
  String toString() {
    return 'Collection{id: $id, name: $name, overview: $overview, '
        'posterPath: $posterPath, backdropPath: $backdropPath, parts: $parts}';
  }

  Collection copyWith({
    int? id,
    String? name,
    String? overview,
    String? posterPath,
    String? backdropPath,
    List<Movie>? parts,
  }) {
    return Collection(
      id: id ?? this.id,
      name: name ?? this.name,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
      parts: parts ?? this.parts,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Collection &&
        other.id == id &&
        other.name == name &&
        other.overview == overview &&
        other.posterPath == posterPath &&
        other.backdropPath == backdropPath &&
        other.parts == parts;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        overview.hashCode ^
        posterPath.hashCode ^
        backdropPath.hashCode ^
        parts.hashCode;
  }
}
