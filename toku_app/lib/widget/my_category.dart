import 'package:flutter/material.dart';

class MyCategory extends StatelessWidget {
  final Color color;
  final String title;
  final String navTo;
  const MyCategory(
    {
      super.key,
      required this.color,
      required this.title,
      required this.navTo,
    }
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context, 
          navTo,
          arguments: {'title': title, 'color': color},
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 24),
        height: 65,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: color,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}