import 'package:flutter/material.dart';
import 'package:practical_2/theme/app_colors.dart';
import 'package:practical_2/viewmodel/cart_item_viewmodel.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CartItemViewmodel>(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          "My Cart",
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.secondry,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage("assets/icon.png"),
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    Text(
                      "The Burger Joint",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      "Change",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),

              Column(
                children: List.generate(
                  vm.items.length,
                  (index) => Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.secondry,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(
                                    vm.items[index].dish.imgPath,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(width: 5),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    vm.items[index].dish.title,
                                    style: TextStyle(
                                      color: AppColors.textPrimary,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    vm.items[index].dish.subtitle,
                                    style: TextStyle(
                                      color: AppColors.textSecondry,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "\$${vm.items[index].dish.price}",
                                    style: TextStyle(
                                      color: AppColors.textPrimary,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Row(
                              children: [
                                InkWell(
                                  onTap: () =>
                                      vm.decrement(vm.items[index].dish),
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: AppColors.shadowSecondry,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Center(
                                      child: Icon(Icons.remove, size: 18),
                                    ),
                                  ),
                                ),

                                SizedBox(width: 10),

                                Text(
                                  "${vm.items[index].quntity}",
                                  style: TextStyle(
                                    color: AppColors.textPrimary,
                                    fontSize: 18,
                                  ),
                                ),

                                SizedBox(width: 10),

                                InkWell(
                                  onTap: () =>
                                      vm.increment(vm.items[index].dish),
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: AppColors.shadowSecondry,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Center(
                                      child: Icon(Icons.add, size: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(right: 10, left: 10, top: 15),
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.secondry,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                    color: AppColors.textSecondry,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "\$${vm.totalPrice.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                children: [
                  Text(
                    "Place Order",
                    style: TextStyle(
                      color: AppColors.secondry,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward_outlined,
                    color: AppColors.secondry,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
