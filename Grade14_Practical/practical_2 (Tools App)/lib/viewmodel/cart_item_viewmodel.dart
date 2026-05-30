import 'package:flutter/material.dart';
import 'package:practical_2/models/cart_item_model.dart';
import 'package:practical_2/models/tool_model.dart';

class CartItemViewmodel extends ChangeNotifier {
  List<CartItemModel> _items = [];
  List<CartItemModel> get items => _items;

  int findTool(ToolModel tool) {
    return _items.indexWhere((item) => item.tool.id == tool.id);
  }

  void addTool(ToolModel tool) {
    final index = findTool(tool);

    // If Tool Found
    if (index != -1) {
      _items[index].quntatity++;
    }
    // If Tool NOT Found
    else {
      _items.add(CartItemModel(tool: tool));
    }

    notifyListeners();
  }

  void removeTool(ToolModel tool) {
    final index = findTool(tool);

    // If Tool Found
    if (index != -1) {
      _items.removeAt(index);
    }

    notifyListeners();
  }

  void increment(ToolModel tool) {
    final index = findTool(tool);

    // If Tool Found
    if (index != -1) {
      _items[index].quntatity++;
    }

    notifyListeners();
  }

  void decrement(ToolModel tool) {
    final index = findTool(tool);

    // If Tool Found
    if (index != -1) {
      if (_items[index].quntatity > 1) {
        _items[index].quntatity--;
      }
    }

    notifyListeners();
  }

  double get totalPrice {
    double sum = 0;

    for (var it in _items) {
      sum += it.totalPrice;
    }

    return sum;
  }
}
