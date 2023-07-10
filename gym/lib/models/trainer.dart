
class Trainer {
  final String name;
  final String description;
  final int price;
  final String? imagePath;

  Trainer(
      {required this.name,
      required this.description,
      required this.price,
      this.imagePath});

  // FromJson, toJson с помощью генерации кода
}