import 'package:flutter/material.dart';
import 'package:practical_4/view/cart_screen.dart';
import 'package:practical_4/view/details_screen.dart';
import 'package:practical_4/view/home_screen.dart';
import 'package:practical_4/viewmodel/cart_item_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartItemViewmodel(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp(
    {
      super.key,
    }
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeScreen(),
        '/details': (context) => DetailsScreen(),
        '/cart': (context) => CartScreen(),
      },
    );
  }

}