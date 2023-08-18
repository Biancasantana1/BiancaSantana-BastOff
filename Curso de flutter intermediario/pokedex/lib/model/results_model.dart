import 'dart:ui';

class Results {
  Results(
      {required this.name,
      required this.url,
      this.imageUrl,
      this.id,
      this.color});

  late final String name;
  late final String url;
  String? imageUrl;
  int? id;
  Color? color;

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
