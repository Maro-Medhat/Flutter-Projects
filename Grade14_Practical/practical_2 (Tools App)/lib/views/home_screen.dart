import 'package:flutter/material.dart';
import 'package:practical_2/data/dummy_data.dart';
import 'package:practical_2/theme/app_colors.dart';
import 'package:practical_2/viewmodel/cart_item_viewmodel.dart';
import 'package:practical_2/widgets/custom_icon_tool.dart';
import 'package:practical_2/widgets/custom_tool_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CartItemViewmodel>(context);
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(
          "Available Tools",
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ARCHITECTURAL GRADE EQUIPMENT",
                      style: TextStyle(
                        color: const Color.fromRGBO(255, 255, 255, 0.8),
                        fontSize: 12,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Precision hear for your next tmasterpiece.",
                      style: TextStyle(
                        color: AppColors.seconary,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),

                    SizedBox(height: 20),

                    CustomIconTool(
                      width: double.infinity,
                      height: 160,
                      iconSize: 80,
                      tool: firstTool,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              Column(
                children: List.generate(
                  dummyTools.length,
                  (index) => Column(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pushNamed(
                          context,
                          "/details",
                          arguments: dummyTools[index],
                        ),
                        child: CustomToolCard(
                          tool: dummyTools[index],
                          isFetured: index == 0,
                          addFunc: () => vm.addTool(dummyTools[index]),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Need a custom kit?",
                      style: TextStyle(
                        color: AppColors.seconary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Contact our project manager for multi-tool bundles and long-term rental offers.",
                      style: TextStyle(
                        color: const Color.fromRGBO(255, 255, 255, 0.6),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(10),
                      width: 120,
                      decoration: BoxDecoration(
                        color: AppColors.seconary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          "Get a Qoute",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.background,
        type: BottomNavigationBarType.fixed,

        currentIndex: 0,

        onTap: (index) => {
          if (index == 1) Navigator.pushNamed(context, "/cart"),
        },

        selectedItemColor: AppColors.primary,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.build), label: "TOOLS"),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
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
