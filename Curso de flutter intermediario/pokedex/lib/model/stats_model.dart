import 'package:pokedex/model/stat_model.dart';

class Stats {
  Stats({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });
  late final int baseStat;
  late final int effort;
  late final Stat stat;

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat = Stat.fromJson(json['stat']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['base_stat'] = baseStat;
    data['effort'] = effort;
    data['stat'] = stat.toJson();
    return data;
  }
}
