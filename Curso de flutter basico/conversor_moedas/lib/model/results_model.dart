import 'package:conversor_moedas/model/currencies_model.dart';

class Results {
  Results({
    required this.currencies,
  });
  late final Currencies currencies;

  Results.fromJson(Map<String, dynamic> json) {
    currencies = Currencies.fromJson(json['currencies']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['currencies'] = currencies.toJson();
    return _data;
  }
}
