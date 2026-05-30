import 'package:flutter/material.dart';
import 'package:practical_3/model/plan_model.dart';

class PlanViewmodel extends ChangeNotifier{
  List<PlanModel> items = [];
  List<PlanModel> get _items =>  items;

  void addPlan(PlanModel plan){
    final int index = items.indexWhere(
      (it) => it.id == plan.id
    );

    //If Item Not Found
    if(index == -1){
      items.add(plan);
    }

    notifyListeners();
  }

  void togglePlan(PlanModel plan){
    plan.isBooked = !plan.isBooked;

    if(plan.isBooked == true){
      items.add(plan);
    }

    else {
      final int index = items.indexWhere(
        (it) => it.id == plan.id
      );

      items.removeAt(index);
    }

    notifyListeners();
  }

  void removePlan(PlanModel plan){
    final int index = items.indexWhere(
      (it) => it.id == plan.id
    );

    items.removeAt(index);
  }

  double get totalPrice {
    double sum = 0;

    for(var it in items){
      sum += it.price;
    }

    return sum;
  }
}