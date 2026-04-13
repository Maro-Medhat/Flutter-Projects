class ClothModel {
  final int id;
  final String title;
  final String subtitle;
  final double price;
  final String color;
  final String imgPath;
  final String size;

  ClothModel(
    {
      required this.id,
      required this.title,
      required this.subtitle,
      required this.price,
      required this.color,
      required this.imgPath,
      required this.size,
    }
  );
}