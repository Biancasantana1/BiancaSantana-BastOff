import 'package:pokedex/model/results_model.dart';

class Pokedex {
  Pokedex({
    required this.count,
    required this.next,
    this.previous,
    required this.results,
  });
  late final int count;
  late final String next;
  late final Null previous;
  late final List<Results> results;

  Pokedex.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = null;
    results =
        List.from(json['results']).map((e) => Results.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    data['results'] = results.map((e) => e.toJson()).toList();
    return data;
  }
}
