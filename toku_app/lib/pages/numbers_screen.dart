import 'package:flutter/material.dart';
import 'package:toku_app/widget/my_tile.dart';

class NumbersScreen extends StatelessWidget {
  const NumbersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final numbers = [
      ["one", "ichi"],
      ["two", "ni"],
      ["three", "san"],
      ["four", "shi"],
      ["five", "go"],
      ["six", "roku"],
      ["seven", "nana"],
      ["eight", "hachi"],
      ["nine", "kyuu"],
      ["ten", "juu"],
    ];
    
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff533c35),
        title: Text(args['title'], style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: numbers.length,
          itemBuilder: (context, i) {
            return MyTile(
              wordJP: numbers[i][1], 
              wordEN: numbers[i][0], 
              img: "assets/images/numbers/number_${i + 1}.png", 
              color: args['color']
            );
          },
        ),
      ),
    );
  }
}
