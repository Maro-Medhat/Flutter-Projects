import 'package:flutter/material.dart';
import 'package:toku_app/widget/my_category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff533c35),
        title: Text(
          "Toku",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          MyCategory(
            color: Color(0xffff9f3a), 
            title: "Numbers", 
            navTo: "/Numbers"
          ),
          MyCategory(
            color: Color(0xff5c8b3e), 
            title: "Family Members", 
            navTo: "/Family Members"
          ),
          MyCategory(
            color: Color(0xff854cae), 
            title: "Colors", 
            navTo: "/Colors"
          ),
          MyCategory(
            color: Color(0xff50b1d3), 
            title: "Phrases", 
            navTo: "/Phrases"
          ),        
        ]
      ),
    );
  }
}