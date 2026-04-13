import 'package:flutter/material.dart';
import 'package:practical_1/theme/app_colors.dart';
import 'package:practical_1/viewmodel/cart_item_viewmodel.dart';
import 'package:practical_1/widgets/custom_card_item_card.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget{
  const CartScreen(
    {
      super.key,
    }
  );

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CartItemViewmodel>(context);
    return Scaffold(
      backgroundColor: AppColors.secondBackground,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Center(
          child: Text(
            "Shopping Cart",
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: IconButton(
              onPressed: () => vm.clearCart(),
              icon: Icon(
                Icons.delete,
                color: AppColors.textPrimary,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
      
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView.separated(
              itemCount: vm.items.length,
              separatorBuilder: (_, _) => SizedBox(height: 10),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomCardItemCard(
                    clothItem: vm.items[index],
                    incrementFunc: () => vm.increment(vm.items[index].cloth),
                    decrementFunc: () => vm.decrement(vm.items[index].cloth),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 10),
            
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
            
              decoration: BoxDecoration(
                color: AppColors.secondary,
                border: Border.all(
                  color: const Color.fromRGBO(158, 158, 158, 0.5),
                ),
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
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "\$${vm.totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 5),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shipping",
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "Calculated at next step",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 10),
                  
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Proceed to Checkout",
                        style: TextStyle(
                          color: AppColors.secondary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}