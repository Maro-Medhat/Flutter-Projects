import 'package:flutter/material.dart';
import 'package:practical_4/model/cart_item_model.dart';
import 'package:practical_4/model/dish_model.dart';

class CartItemViewmodel extends ChangeNotifier{
  List<CartItemModel> _items = [];

  List<CartItemModel> get items => _items;

  int findItem(DishModel dish){
    return _items.indexWhere(
      (item) => item.dish.id == dish.id,
    );
  }

  void addDish(DishModel dish){
    final int index = findItem(dish);

    // If Item Found
    if(index != -1){
      _items[index].quntity++;
    }

    // If Item NOT Found
    else{
      _items.add(CartItemModel(dish: dish));
    }

    notifyListeners();
  }

  void increment(DishModel dish){
    final int index = findItem(dish);

    // If Item Found
    if(index != -1){
      _items[index].quntity++;
    }

    notifyListeners();
  }

  void decrement(DishModel dish){
    final int index = findItem(dish);

    // If Item Found
    if(index != -1){
      // If There Are More Than 1
      if(_items[index].quntity > 1){
        _items[index].quntity--;
      }

      // If There Is Exactly 1
      else{
        _items.removeAt(index);
      }
    }

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