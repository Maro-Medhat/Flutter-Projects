import 'package:flutter/material.dart';
import 'package:practical_3/theme/app_colors.dart';
import 'package:practical_3/view/cart_screen.dart';
import 'package:practical_3/view/details_screen.dart';
import 'package:practical_3/view/home_screen.dart';
import 'package:practical_3/viewmodel/plan_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PlanViewmodel(),
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp(
    {
      super.key
    }
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.background,
        )
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeScreen(),
        '/details': (context) => DetailsScreen(),
        '/cart': (context) => CartScreen(),
      },
    );
  }
}

