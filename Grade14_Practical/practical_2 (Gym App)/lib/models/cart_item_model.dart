import 'package:practical_2/models/tool_model.dart';

class CartItemModel {
  final ToolModel tool;
  int quntatity;

  CartItemModel(
    {
      required this.tool,
      this.quntatity = 1
    }
  );

  double get totalPrice => tool.price * quntatity;
}