class PokedexModel {
  final String name;
  final List<String> weakness;
  final String number;
  final String description;
  final String thumbnailImage;
  final int id;
  final List<String> type;

  PokedexModel({
    required this.name,
    required this.weakness,
    required this.number,
    required this.description,
    required this.thumbnailImage,
    required this.id,
    required this.type,
  });

  factory PokedexModel.fromJson(Map<String, dynamic> json) {
    return PokedexModel(
      name: json['name'],
      weakness: List<String>.from(json['weakness']),
      number: json['number'],
      description: json['description'],
      thumbnailImage: json['thumbnailImage'],
      id: json['id'],
      type: List<String>.from(json['type']),
    );
  }
}
