import 'package:practical_2/model/dish_model.dart';

class RestaurantModel {
  final int id;
  final String title;
  final String subtitle;
  final String deliveryTime;
  final String country;
  final String imgPath;
  final double rate;
  final List<DishModel> dishes;

  RestaurantModel(
    {
      required this.id,
      required this.title,
      required this.subtitle,
      required this.deliveryTime,
      required this.country,
      required this.imgPath,
      required this.rate,
      required this.dishes,
    }
  );
}