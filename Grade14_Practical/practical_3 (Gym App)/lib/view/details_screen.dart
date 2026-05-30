import 'package:flutter/material.dart';
import 'package:practical_3/data/dummy_data.dart';
import 'package:practical_3/model/plan_model.dart';
import 'package:practical_3/theme/app_colors.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PlanModel plan = ModalRoute.of(context)!.settings.arguments as PlanModel;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        plan.imgPath,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 0, 0, 0.5),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.secondry,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plan.title,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  SizedBox(height: 20),

                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.only(right: 10),
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.shadow,
                          borderRadius: BorderRadius.circular(10), 
                        ),
                        child: Center(
                          child: Text(
                            "HITT",
                            style: TextStyle(
                              color:  AppColors.textPrimary,
                              fontSize: 20
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.only(right: 10),
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.shadow,
                          borderRadius: BorderRadius.circular(10), 
                        ),
                        child: Center(
                          child: Text(
                            "Beginner",
                            style: TextStyle(
                              color:  AppColors.textPrimary,
                              fontSize: 20
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.only(right: 10),
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.shadow,
                          borderRadius: BorderRadius.circular(10), 
                        ),
                        child: Center(
                          child: Text(
                            "60 min",
                            style: TextStyle(
                              color:  AppColors.textPrimary,
                              fontSize: 20
                            ),
                          ),
                        ),
                      ),
                    ]
                  ),
                
                  SizedBox(height: 20),

                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 2
                    ),
                    itemBuilder: (context, index) => Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.secondry,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            dummyCardsContent[index][0],
                            color: AppColors.primary,
                            size: 30,
                          ),
                          Text(
                            dummyCardsContent[index][1],
                            style: TextStyle(
                              color: AppColors.textSecondry,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            dummyCardsContent[index][2],
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}