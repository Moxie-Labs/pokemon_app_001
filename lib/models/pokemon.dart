class Pokemon {
  final String name;
  final String imageUrl;
  final List<String> types;
  final List<String> abilities;

  Pokemon({
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.abilities,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      imageUrl: json['sprites']['front_default'] ?? '',
      types: (json['types'] as List)
          .map((type) => type['type']['name'].toString())
          .toList(),
      abilities: (json['abilities'] as List)
          .map((ability) => ability['ability']['name'].toString())
          .toList(),
    );
  }
}