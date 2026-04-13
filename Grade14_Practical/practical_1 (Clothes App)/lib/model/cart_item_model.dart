import 'package:practical_1/model/cloth_model.dart';

class CartItemModel {
  final ClothModel cloth;
  int quantity;

  CartItemModel(
    {
      required this.cloth,
      this.quantity = 1,
    }
  );

  double get totalPrice => quantity * cloth.price;
}