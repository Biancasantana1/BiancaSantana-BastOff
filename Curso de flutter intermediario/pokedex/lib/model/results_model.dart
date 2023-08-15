class Results {
  Results({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

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
