import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd2bcd5),
      body: Center(child: 
      Image.asset("assets/birthday.png"),
    ),
    );
  }
}
