import 'package:flutter/material.dart';
import 'package:practical_2/model/restaurant_model.dart';
import 'package:practical_2/theme/app_colors.dart';

class CustomRestaurantCard extends StatelessWidget{
  final RestaurantModel restaurant;
  final isFreeDelivery;
  const CustomRestaurantCard(
    {
      super.key,
      required this.restaurant,
      required this.isFreeDelivery
    }
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => Navigator.pushNamed(context, '/details'),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20)
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      restaurant.imgPath,
                    ),
                    fit: BoxFit.cover
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.shadowSecondry,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Icon(
                      isFreeDelivery
                      ? Icons.favorite
                      : Icons.favorite_border,
                
                      color: isFreeDelivery
                      ? Colors.red
                      : Colors.black,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppColors.secondry,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    restaurant.deliveryTime,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 15,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                spreadRadius: 0,
                color: const Color.fromRGBO(0, 0, 0, 0.1),
                blurRadius: 6,
                offset: Offset(2, 2)
              )
            ],
            color: AppColors.secondry,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    restaurant.title,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.primary,
                        size: 15,
                      ),

                      SizedBox(width: 5),

                      Text(
                        "${restaurant.rate}",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                ],
              ),

              Text(
                restaurant.subtitle,
                style: TextStyle(
                  color: AppColors.textSecondry,
                  fontSize: 13,
                ),
              ),
            
              SizedBox(height: 10),

              isFreeDelivery
              ? Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                height: 25,
                decoration: BoxDecoration(
                  color: AppColors.shadowPrimary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Free Delivery",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 14,
                  ),
                ),
              )
              : SizedBox(),
            ],
          ),
        ),
      ],
    );
  }

}