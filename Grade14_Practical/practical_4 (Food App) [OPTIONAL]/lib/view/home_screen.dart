import 'package:flutter/material.dart';
import 'package:practical_2/data/dummy_data.dart';
import 'package:practical_2/theme/app_colors.dart';
import 'package:practical_2/widgets/custom_restaurant_card.dart';

class HomeScreen extends StatelessWidget{
  
  const HomeScreen(
    {
      super.key,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: Icon(
          Icons.location_on,
          color: AppColors.primary,
          size: 25,
        ),
        title: Text(
          "Delivering to 123 Main St",
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.shadowSecondry,
                borderRadius: BorderRadius.circular(100)
              ),
              child: Icon(
                Icons.person,
                color: AppColors.textPrimary,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.textSecondry,
                  ),
                  hintText: "Search for restaurants or dishes",
                  hintStyle: TextStyle(
                    color: AppColors.textSecondry,
                    fontSize: 15,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none
                  ),
                  filled: true,
                  fillColor: AppColors.shadowSecondry,
                ),
              ),
                          
              SizedBox(height: 10),
                          
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodTypes.length,
                  separatorBuilder: (_, _) => SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      height: 40,
                      decoration: BoxDecoration(
                        color: index == 0
                        ? AppColors.primary
                        : AppColors.shadowSecondry,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            foodTypes[index][1],
                            size: 16,
                            color: index == 0
                            ? AppColors.secondry
                            : AppColors.textPrimary
                          ),
                          
                          SizedBox(width: 5),
                          
                          Text(
                            foodTypes[index][0],
                            style: TextStyle(
                              color: index == 0
                              ? AppColors.secondry
                              : AppColors.textPrimary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
                            
              SizedBox(height: 10),
                          
              Column(
                children: List.generate(
                  dummyRestaurant.length,
                  (index) { 
                    return Column(
                      children: [
                        CustomRestaurantCard(
                          restaurant: dummyRestaurant[index],
                          isFreeDelivery: index == 0,
                        ),
              
                        SizedBox(height: 10),
                      ],
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: 0,

        onTap: (index) => {
          if(index == 3)
            Navigator.pushNamed(context, '/cart'),
        },

        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondry,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Seach",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: "Orders",
          ),
          
          BottomNavigationBarItem(
            
            icon: Icon(Icons.shopping_bag),
            label: "Cart",
          ),
        ]
      ),
    );
  }

}