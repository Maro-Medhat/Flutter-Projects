import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff344f69),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 112,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 110,
                backgroundImage: AssetImage("assets/logo.png"),
              ),
            ),
            Text(
              "Tharwat Samy",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontFamily: "Pacifico",
              ),
            ),
            Text(
              "FLUTTER DEVELOPER",
              style: TextStyle(
                color: Color(0xff6c8090),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              color: Color(0xff6c8090),
              thickness: 1,
              indent: 60,
              endIndent: 60,
              height: 10,
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  size: 32,
                  color: Color(0xff344f69),
                ),
                title: Text(
                  "(+20) 123456779",
                  style: TextStyle(
                    fontSize: 20,
                  )
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: Icon(
                  Icons.mail,
                  size: 32,
                  color: Color(0xff344f69),
                ),
                title: Text(
                  "tharwatsamy@gmail.com",
                  style: TextStyle(
                    fontSize: 20,
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
