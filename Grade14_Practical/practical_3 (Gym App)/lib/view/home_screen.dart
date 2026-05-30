import 'package:flutter/material.dart';
import 'package:practical_3/data/dummy_data.dart';
import 'package:practical_3/theme/app_colors.dart';
import 'package:practical_3/viewmodel/plan_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PlanViewmodel>(context);
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/cart'),
            child: Stack(
              children: [
                Icon(
                  Icons.shopping_bag,
                  color: AppColors.textPrimary,
                  size: 40,
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      vm.items.length.toString(),
                      style: TextStyle(
                        color: AppColors.secondry,
                        fontSize: 15
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Find Your Class",
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.shadow,
                prefixIcon: Icon(
                  Icons.search,
                ),
                prefixIconColor: Colors.grey,
                hintText: "Search for a class or instructor",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
                ),
              ),
            ),
          
            SizedBox(height: 10),

            Row(
              children: List.generate(
                dummyTypes.length,
                (index) => Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                    color: index == 0
                    ? AppColors.primary
                    : AppColors.shadow,
                    borderRadius: BorderRadius.circular(10), 
                  ),
                  child: Center(
                    child: Text(
                      dummyTypes[index],
                      style: TextStyle(
                        color: index == 0
                        ? AppColors.secondry
                        : AppColors.textPrimary,
                        fontSize: 20
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            Row(
              children: [
                SizedBox(
                  width: 40,
                  height: 100,
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.textPrimary,
                    size: 30,
                  ),
                ),
                Row(
                  children: List.generate(
                    dummyDays.length,
                    (index) => Container(
                      width: 80,
                      height: 100,
                      decoration: BoxDecoration(
                        color: index == 1 
                        ? AppColors.primary
                        :Colors.transparent,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            dummyDays[index],
                            style: TextStyle(
                              color: index == 1
                              ? AppColors.secondry
                              : AppColors.textSecondry,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "${index + 13}",
                            style: TextStyle(
                              color: index == 1
                              ? AppColors.secondry
                              : AppColors.textPrimary,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    )
                  ),
                )
              ],
            ),
          
            SizedBox(height: 20),

            Column(
              children: List.generate(
                dummyPlans.length,
                (index) => InkWell(
                  onTap: () => Navigator.pushNamed(context, '/details', arguments: dummyPlans[index]),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.27,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              dummyPlans[index].imgPath,
                            ),
                          )
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.27,
                        decoration: BoxDecoration(
                          color: AppColors.secondry,
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "All Levels",
                              style: TextStyle(
                                color: AppColors.textSecondry,
                                fontSize: 18
                              ),
                            ),
                  
                            SizedBox(height: 10),
                  
                            Text(
                              dummyPlans[index].title,
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                  
                            SizedBox(height: 10),
                  
                            Text(
                              "with Alex Ray",
                              style: TextStyle(
                                color: AppColors.textSecondry,
                                fontSize: 18,
                              ),
                            ),
                  
                            SizedBox(height: 10),
                  
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "7:00 AM - 7:45 AM",
                                  style: TextStyle(
                                    color: AppColors.textSecondry,
                                    fontSize: 18,
                                  ),
                                ),
                                InkWell(
                                  onTap: () => vm.togglePlan(dummyPlans[index]),
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: dummyPlans[index].isBooked == true
                                      ? AppColors.shadow
                                      : AppColors.primary,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        dummyPlans[index].isBooked == true
                                        ? "Booked"
                                        : "Add to Cart",
                                        style: TextStyle(
                                          color: dummyPlans[index].isBooked == true
                                          ? AppColors.textPrimary
                                          : AppColors.secondry
                                        ),
                                      ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}