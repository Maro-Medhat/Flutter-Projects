import 'package:flutter/material.dart';
import 'package:practical_2/theme/app_colors.dart';
import 'package:practical_2/viewmodel/cart_item_viewmodel.dart';
import 'package:practical_2/widgets/custom_icon_tool.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CartItemViewmodel>(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          "Your Cart",
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(33, 150, 243, 0.2),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(Icons.person, color: AppColors.primary),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.48,
            child: ListView(
              children: [
                Column(
                  children: List.generate(vm.items.length, (index) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.seconary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomIconTool(
                                    width: 80,
                                    height: 80,
                                    iconSize: 40,
                                    tool: vm.items[index].tool,
                                  ),

                                  SizedBox(width: 5),

                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        vm.items[index].tool.title,
                                        style: TextStyle(
                                          color: AppColors.textPrimary,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "\$${vm.items[index].tool.price} / day",
                                        style: TextStyle(
                                          color: AppColors.textSecondary,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Expanded(child: SizedBox()),

                                  InkWell(
                                    onTap: () =>
                                        vm.removeTool(vm.items[index].tool),
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                          244,
                                          67,
                                          54,
                                          0.2,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Icon(
                                        Icons.delete_outline,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),

                                  SizedBox(width: 10),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "NUMBER OF DAYS",
                                    style: TextStyle(
                                      color: AppColors.textSecondary,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () =>
                                            vm.decrement(vm.items[index].tool),
                                        child: Container(
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.remove,
                                            color: AppColors.seconary,
                                            size: 20,
                                          ),
                                        ),
                                      ),

                                      SizedBox(width: 10),

                                      Text(
                                        "${vm.items[index].quntatity}",
                                        style: TextStyle(
                                          color: AppColors.textPrimary,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      SizedBox(width: 10),

                                      InkWell(
                                        onTap: () =>
                                            vm.increment(vm.items[index].tool),
                                        child: Container(
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: AppColors.seconary,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.seconary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Subtotal",
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "\$${(vm.totalPrice.toStringAsFixed(2))}",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Service Fee",
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      vm.totalPrice > 0 ? "\$10.00" : "0",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                Divider(),

                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$${((vm.totalPrice + 10).toStringAsFixed(2))}",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.primary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Procced to Checkout",
                  style: TextStyle(
                    color: AppColors.seconary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(width: 10),

                Icon(
                  Icons.arrow_forward_outlined,
                  color: AppColors.seconary,
                  size: 25,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.background,
        type: BottomNavigationBarType.fixed,

        currentIndex: 1,

        onTap: (index) => {if (index == 0) Navigator.pushNamed(context, "/")},

        selectedItemColor: AppColors.primary,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.build_outlined),
            label: "TOOLS",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "CART",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: "ORDERS",
          ),
        ],
      ),
    );
  }
}
