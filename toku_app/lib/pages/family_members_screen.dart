import 'package:flutter/material.dart';
import 'package:toku_app/widget/my_tile.dart';

class FamilyMembersScreen extends StatelessWidget {
  const FamilyMembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final args = ModalRoute.of(context)!.settings.arguments as Map;
  final List family = [
    ["daughter", "Musume"],
    ["father", "Chichi"],
    ["grandfather", "Sofu"],
    ["grandmother", "Sobo"],
    ["mother", "Haha"],
    ["older_brother", "Ani"],
    ["older_sister", "Ane"],
    ["son", "Musuko"],
    ["younger_brother", "Otōto"],
    ["younger_sister", "Imōto"],
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
          itemCount: family.length,
          itemBuilder: (context, i) {
            return MyTile(
              wordJP: family[i][1], 
              wordEN: family[i][0], 
              color: args['color'], 
              img: "assets/images/family_members/family_${family[i][0]}.png"
            );
          }
        ),
      ),
    );
  }
}
