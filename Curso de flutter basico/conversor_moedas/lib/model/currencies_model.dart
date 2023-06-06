import 'package:conversor_moedas/model/moeda_model.dart';

class Currencies {
  Currencies({
    required this.source,
    required this.currencyMap,
  });

  final String source;
  final Map<String, Moeda> currencyMap;

  Currencies.fromJson(Map<String, dynamic> json)
      : source = json['source'],
        currencyMap = {} {
    for (final entry in json.entries) {
      if (entry.key != 'source') {
        currencyMap[entry.key] = Moeda.fromJson(entry.value);
      }
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{'source': source};

    for (final entry in currencyMap.entries) {
      data[entry.key] = entry.value.toJson();
    }

    return data;
  }
}
