import 'package:flutter/material.dart';
import 'package:practical_1/model/cart_item_model.dart';
import 'package:practical_1/model/cloth_model.dart';

class CartItemViewmodel extends ChangeNotifier{
  List<CartItemModel> _items = [];

  List<CartItemModel> get items => _items;

  int findItem(ClothModel cloth){
    return _items.indexWhere(
      (item) => item.cloth.id == cloth.id
    );
  }

  void addCloth(ClothModel cloth){
    final index = findItem(cloth);

    // If Item Found
    if(index != -1) {
      _items[index].quantity++;
    }

    // If Item NOT Found
    else {
      _items.add(CartItemModel(cloth: cloth));
    }

    notifyListeners();
  }

  void increment(ClothModel cloth){
    final index = findItem(cloth);

    // If Item Found
    if(index != -1){
      _items[index].quantity++;
    }

    notifyListeners();
  }

  void decrement(ClothModel cloth){
    final index = findItem(cloth);

    // If Item Found
    if(index != -1){
      // If There Are More Than 1 From This Item
      if(_items[index].quantity > 1){
        _items[index].quantity--;
      }

      // If There Is EXACTLY 1 From This Item
      else {
        _items.removeAt(index);
      }
    }

    notifyListeners();
  }

  void clearCart() {
    _items.clear();

    notifyListeners();
  }

  double get totalPrice {
    double sum = 0;

    for(var item in _items){
      sum += item.totalPrice;
    }

    return sum;
  }
}