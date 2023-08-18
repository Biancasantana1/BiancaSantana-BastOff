import 'package:pokedex/model/type_model.dart';

import 'moves_model.dart';
import 'sprites_model.dart';
import 'stats_model.dart';

class Pokemon {
  Pokemon(
      {required this.height,
      required this.weight,
      required this.name,
      required this.stats,
      required this.moves,
      required this.sprites,
      required this.id,
      required this.types});
  late final int height;
  late final int weight;
  late final String name;
  late final List<Stats> stats;
  late final List<Moves> moves;
  late final Sprites sprites;
  late final int id;
  late final List<Types> types;

  Pokemon.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    weight = json['weight'];
    name = json['name'];
    stats = List.from(json['stats']).map((e) => Stats.fromJson(e)).toList();
    moves = List.from(json['moves']).map((e) => Moves.fromJson(e)).toList();
    sprites = Sprites.fromJson(json['sprites']);
    id = json['id'];
    types = List.from(json['types']).map((e) => Types.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['height'] = height;
    data['weight'] = weight;
    data['name'] = name;
    data['stats'] = stats.map((e) => e.toJson()).toList();
    data['moves'] = moves.map((e) => e.toJson()).toList();
    data['sprites'] = sprites.toJson();
    data['id'] = id;
    data['types'] = types.map((e) => e.toJson()).toList();
    return data;
  }
}
