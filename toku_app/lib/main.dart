import 'package:flutter/material.dart';
import 'package:toku_app/pages/colors_screen.dart';
import 'package:toku_app/pages/family_members_screen.dart';
import 'package:toku_app/pages/home_screen.dart';
import 'package:toku_app/pages/numbers_screen.dart';
import 'package:toku_app/pages/phrases_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeScreen(),
        '/Numbers': (context) => NumbersScreen(),
        '/Family Members': (context) => FamilyMembersScreen(),
        '/Colors': (context) => ColorsScreen(),
        '/Phrases': (context) => PhrasesScreen(),
      }
    );
  }
}
