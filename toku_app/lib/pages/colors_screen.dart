import 'package:flutter/material.dart';
import 'package:toku_app/widget/my_tile.dart';

class ColorsScreen extends StatelessWidget {

  const ColorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final args = ModalRoute.of(context)!.settings.arguments as Map;
  final List colors = [
    ["black", "kuro"],
    ["brown", "chairo"],
    ["dusty_yellow", "Kusunda kiiro"],
    ["gray", "Haiiro"],
    ["red", "aka"],
    ["white", "shiro"],
    ["yellow", "kiiro"],
  ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color(0xff533c35),
        title: Text(
          args['title'],
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: colors.length,
          itemBuilder: (context, i) {
            return MyTile(
              wordJP: colors[i][1], 
              wordEN: colors[i][0], 
              color: args['color'], 
              img: "assets/images/colors/color_${colors[i][0]}.png"
            );
          }
        ),
      ),
    );
  }
}
