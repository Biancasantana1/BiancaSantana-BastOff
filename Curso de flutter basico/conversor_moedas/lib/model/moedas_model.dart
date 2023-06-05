import 'package:conversor_moedas/model/results_model.dart';

class Moedas {
  Moedas({
    required this.by,
    required this.validKey,
    required this.results,
    required this.executionTime,
    required this.fromCache,
  });
  final String by;
  final bool validKey;
  final Results results;
  final double executionTime;
  final bool fromCache;

  Moedas.fromJson(Map<String, dynamic> json)
      : by = json['by'],
        validKey = json['valid_key'],
        results = Results.fromJson(json['results']),
        executionTime = json['execution_time'],
        fromCache = json['from_cache'];

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['by'] = by;
    _data['valid_key'] = validKey;
    _data['results'] = results.toJson();
    _data['execution_time'] = executionTime;
    _data['from_cache'] = fromCache;
    return _data;
  }
}
