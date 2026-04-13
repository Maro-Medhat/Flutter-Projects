import 'package:flutter/material.dart';
import 'package:practical_1/model/cart_item_model.dart';
import 'package:practical_1/theme/app_colors.dart';

class CustomCardItemCard extends StatelessWidget{
  final CartItemModel clothItem;
  final VoidCallback incrementFunc;
  final VoidCallback decrementFunc;

  const CustomCardItemCard(
    {
      super.key,
      required this.clothItem,
      required this.incrementFunc,
      required this.decrementFunc,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  clothItem.cloth.imgPath,
                ),
              ),
            ),
          ),

          SizedBox(width: 10),

          Container(
            width: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  clothItem.cloth.title,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Color: ${clothItem.cloth.color}\n Size: ${clothItem.cloth.size}",
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                  ),
                ),  
                Text(
                  "\$${clothItem.cloth.price}",
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        
          SizedBox(width: 10),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            width: 80,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.grey,
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: decrementFunc,
                  child: Icon(
                      Icons.remove,
                    color: Colors.grey,
                  ),
                ),

                Text(
                  "${clothItem.quantity}",
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                InkWell(
                  onTap: incrementFunc,
                  child: Icon(
                    Icons.add,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}