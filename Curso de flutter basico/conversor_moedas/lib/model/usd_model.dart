class USD {
  USD({
    required this.name,
    required this.buy,
    required this.sell,
    required this.variation,
  });
  late final String name;
  late final double buy;
  late final double? sell;
  late final double variation;

  USD.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    buy = json['buy'];
    sell = json['sell'];
    variation = json['variation'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['buy'] = buy;
    _data['sell'] = sell;
    _data['variation'] = variation;
    return _data;
  }
}
