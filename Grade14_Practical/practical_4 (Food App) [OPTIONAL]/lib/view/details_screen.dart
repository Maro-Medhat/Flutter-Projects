import 'package:flutter/material.dart';
import 'package:practical_2/data/dummy_data.dart';
import 'package:practical_2/model/restaurant_model.dart';
import 'package:practical_2/theme/app_colors.dart';
import 'package:practical_2/viewmodel/cart_item_viewmodel.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CartItemViewmodel>(context);
    final restaurant =
        ModalRoute.of(context)!.settings.arguments as RestaurantModel;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        actions: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: AppColors.secondry,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(Icons.search, color: AppColors.textPrimary, size: 22),
          ),

          SizedBox(width: 10),

          InkWell(
            onTap: () => Navigator.pushNamed(context, "/cart"),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: AppColors.secondry,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                Icons.shopping_cart,
                color: AppColors.textPrimary,
                size: 22,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(restaurant.imgPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: 10),

              Text(
                restaurant.title,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    restaurant.country,
                    style: TextStyle(
                      color: AppColors.textSecondry,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: AppColors.primary, size: 20),
                      Text(
                        "${restaurant.rate}",
                        style: TextStyle(
                          color: AppColors.textSecondry,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    restaurant.deliveryTime,
                    style: TextStyle(
                      color: AppColors.textSecondry,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 50),
                ],
              ),

              SizedBox(height: 30),

              SizedBox(
                height: 35,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, _) => SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: index == 0
                            ? AppColors.primary
                            : AppColors.secondry,
                      ),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            color: index == 0
                                ? AppColors.secondry
                                : AppColors.textPrimary,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 30),

              Text(
                categories[0],
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),

              Column(
                children: List.generate(restaurant.dishes.length, (index) {
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          color: AppColors.secondry,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(
                                    restaurant.dishes[index].imgPath,
                                  ),
                                ),
                              ),
                            ),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    restaurant.dishes[index].title,
                                    style: TextStyle(
                                      color: AppColors.textPrimary,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    restaurant.dishes[index].subtitle,
                                    style: TextStyle(
                                      color: AppColors.textSecondry,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$${restaurant.dishes[index].price}",
                                        style: TextStyle(
                                          color: AppColors.textPrimary,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () => vm.addDish(
                                          restaurant.dishes[index],
                                        ),
                                        child: Container(
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: AppColors.shadowPrimary,
                                            borderRadius: BorderRadius.circular(
                                              100,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
      ),
      bottomNavigationBar: InkWell(
        onTap: () => Navigator.pushNamed(context, "/cart"),
        child: Container(
          margin: EdgeInsets.only(right: 10, left: 10, bottom: 20),
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.btnBackground,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromRGBO(255, 255, 255, 0.2),
                ),
                child: Center(
                  child: Text(
                    "${vm.items.length}",
                    style: TextStyle(
                      color: AppColors.secondry,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text(
                "View Cart",
                style: TextStyle(
                  color: AppColors.secondry,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "\$${vm.totalPrice.toStringAsFixed(2)}",
                style: TextStyle(
                  color: AppColors.secondry,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
