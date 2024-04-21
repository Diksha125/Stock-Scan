class StockData {
  final int? id;
  final String? name;
  final String? tag;
  final String? color;
  final List<Criteria>? criteria;

  StockData({this.id, this.name, this.tag, this.color, this.criteria});

  factory StockData.fromJson(Map<String, dynamic> json) {
    return StockData(
      id: json['id'],
      name: json['name'],
      tag: json['tag'],
      color: json['color'],
      criteria: (json['criteria'] as List<dynamic>?)
          ?.map((criteriaJson) => Criteria.fromJson(criteriaJson))
          .toList(),
    );
  }
}

class Criteria {
  final String? type;
  final String? text;
  final Map<String, dynamic>? variable;

  Criteria({
    required this.type,
    required this.text,
    this.variable,
  });

  factory Criteria.fromJson(Map<String, dynamic> json) {
    return Criteria(
      type: json['type'],
      text: json['text'],
      variable: json['variable'],
    );
  }
}
