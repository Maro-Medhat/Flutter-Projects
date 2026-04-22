import 'package:practical_4/model/dish_model.dart';

class CartItemModel {
  final DishModel dish;
  int quntity;

  CartItemModel(
    {
      required this.dish,
      this.quntity = 1,
    }
  );

  double get totalPrice => quntity * dish.price;
}