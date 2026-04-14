class DishModel {
  final int id;
  final String title;
  final String subtitle;
  final String imgPath;
  final double price;

  DishModel(
    {
      required this.id,
      required this.title,
      required this.subtitle,
      required this.imgPath,
      required this.price,
    }
  );
}