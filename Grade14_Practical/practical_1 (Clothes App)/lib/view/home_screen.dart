import 'package:flutter/material.dart';
import 'package:practical_1/data/dummy_data.dart';
import 'package:practical_1/theme/app_colors.dart';
import 'package:practical_1/viewmodel/cart_item_viewmodel.dart';
import 'package:practical_1/widgets/custom_cloth_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CartItemViewmodel>(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: Icon(
          Icons.search,
          size: 20,
        ),
        title: Center(
          child: Text(
            "New Arrivals",
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () => Navigator.pushNamed(context, "/cart"),
            child: Stack(
              children: [
                Icon(
                  Icons.shopping_bag,
                  color: Colors.black,
                  size: 30,
                ),
                Positioned(
                  left: 0,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        "${vm.items.length}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFE9E9E9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Filter",
                          style: TextStyle(
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Icon(
                          Icons.tune,
                          color: AppColors.textPrimary,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(width: 15),
                  
                  Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFE9E9E9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Sort by",
                          style: TextStyle(
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Icon(
                          Icons.expand_more,
                          color: AppColors.textPrimary,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          
              SizedBox(height: 40),
          
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
          
                itemCount: 6,
          
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.56
                ),
          
                itemBuilder: (context, index) {
                  return CustomClothCard(
                    cloth: dummyClothes[index],
                    addCloth: () => vm.addCloth(dummyClothes[index]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.background,

        currentIndex: 1,
        selectedItemColor: AppColors.primary,

        unselectedItemColor: AppColors.textSecondary,
        unselectedLabelStyle: TextStyle(
          color: AppColors.textSecondary,
        ),

        type: BottomNavigationBarType.fixed,

        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home
            ),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.grid_view_sharp
            ),
            label: "Categories",
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite
            ),
            label: "Whishlist",
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.person
            ),
            label: "Profile",
          ),
        ]
      ),
    );
  }
}