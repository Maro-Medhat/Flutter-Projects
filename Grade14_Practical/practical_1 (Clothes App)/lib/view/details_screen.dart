import 'package:flutter/material.dart';
import 'package:practical_1/data/dummy_data.dart';
import 'package:practical_1/model/cloth_model.dart';
import 'package:practical_1/theme/app_colors.dart';
import 'package:practical_1/viewmodel/cart_item_viewmodel.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget{
  const DetailsScreen(
    {
      super.key,
    }
  );

  @override
  Widget build(BuildContext context) {
    final ClothModel cloth = ModalRoute.of(context)!.settings.arguments as ClothModel;
    final vm = Provider.of<CartItemViewmodel>(context);

    return Scaffold(
      backgroundColor: AppColors.secondBackground,
      appBar: AppBar(
        backgroundColor: AppColors.secondBackground,
        title: Center(
          child: Text(
            cloth.title,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.favorite,
              color: Colors.black
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    cloth.imgPath,
                  ),
                ),
              ),
            ),
          
            SizedBox(height: 20),

            Text(
              cloth.title,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          
            SizedBox(height: 10),

            Text(
              cloth.subtitle,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 15,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "\$${cloth.price}",
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          
            SizedBox(height: 20),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Size",
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: sizes.length,
                    separatorBuilder: (_, _) => SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey,
                          )
                        ),
                        child: Center(
                          child: Text(
                            sizes[index],
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          
            SizedBox(height: 20),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Quantity",
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.remove,
                        color: Colors.grey,
                        size: 20,
                      ),
                  
                      Text(
                        "1",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                  
                      Icon(
                        Icons.add,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
          
            SizedBox(height: 20),

            InkWell(
              onTap: () {
                vm.addCloth(cloth);
                Navigator.pushNamed(context, "/cart");
              },
              child: Container(
                padding: EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag,
                      color: AppColors.secondary,
                    ),
              
                    SizedBox(width: 10),
                    
                    Text(
                      "Add To Cart",
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}