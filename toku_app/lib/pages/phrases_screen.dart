import 'package:flutter/material.dart';
import 'package:toku_app/widget/my_tile.dart';

class PhrasesScreen extends StatelessWidget {
  const PhrasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final args = ModalRoute.of(context)!.settings.arguments as Map;
  final List phrases = [
    [
      "Are you coming?",
      "Kimasu ka?"
    ],
    [
      "Don't forget to subscribe",
      "Tōroku o wasurenaide kudasai"
    ],
    [
      "How are you feeling?",
      "Kibun wa dō desu ka?"
    ],
    [
      "I love animals",
      "Puroguramingu ga daisuki desu"
    ],
    [
      "I love programming",
      "Puroguramingu ga daisuki desu"
    ],
    [
      "Programming is easy",
      "Puroguramingu wa kantan desu"
    ],
    [
      "What is your name?",
      "Namae wa nan desu ka?"
    ],
    [
      "Where are you going?",
      "Doko e ikimasu ka?"
    ],
    [
      "Yes, I'm coming",
      "Kimasu ka?"
    ],
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
          itemCount: phrases.length,
          itemBuilder: (context, i) {
            return MyTile(
              wordJP: phrases[i][1], 
              wordEN: phrases[i][0], 
              color: args['color'], 
              img: "",
            );
          }
        ),
      )
    );
  }
}
