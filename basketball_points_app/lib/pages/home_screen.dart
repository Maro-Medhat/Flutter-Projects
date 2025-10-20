import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int teamAPoints = 0;
  int teamBPoints = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Points Counter", style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("Team A", style: TextStyle(fontSize: 32)),
                    Text('$teamAPoints', style: TextStyle(fontSize: 150)),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          teamAPoints += 1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: Text(
                        "Add 1 Point",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          teamAPoints += 2;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: Text(
                        "Add 2 Point",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          teamAPoints += 3;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: Text(
                        "Add 3 Point",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                VerticalDivider(thickness: 1, color: Colors.grey, indent: 20),
                Column(
                  children: [
                    Text("Team B", style: TextStyle(fontSize: 32)),
                    Text('$teamBPoints', style: TextStyle(fontSize: 150)),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          teamBPoints += 1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: Text(
                        "Add 1 Point",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          teamBPoints += 2;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: Text(
                        "Add 2 Point",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          teamBPoints += 3;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: Text(
                        "Add 3 Point",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 100),
          ElevatedButton(
            onPressed: () {
              setState(
                () {
                  teamAPoints = 0;
                  teamBPoints = 0;
                }
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              backgroundColor: Colors.orange,
            ),
            child: Text(
              "Reset",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
