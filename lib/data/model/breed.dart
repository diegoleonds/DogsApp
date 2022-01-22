class Breed {
  final String name;
  final List<String> subBreeds;

  Breed({
    required this.name,
    required this.subBreeds
  });

  factory Breed.fromJson(Map<String, dynamic> json) {
    return Breed(
      name: json['name'],
      subBreeds: json['subBreeds']
    );
  }
}