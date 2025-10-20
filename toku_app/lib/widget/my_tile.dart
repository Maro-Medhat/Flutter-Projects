import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  final String wordJP;
  final String wordEN;
  final String img;
  final Color color;
  const MyTile({
    super.key,
    required this.wordJP,
    required this.wordEN,
    required this.color,
    required this.img, 
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        img != "" ? Container(
          decoration: BoxDecoration(color: Color(0xFFFFF6DC)),
          width: 100,
          height: 100,
          child: Image.asset(img),
        ) : SizedBox(),
        Expanded(
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            tileColor: color,
            title: Text(
              wordJP,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              wordEN,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            trailing: Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
