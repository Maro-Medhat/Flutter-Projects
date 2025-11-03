import 'package:flutter/material.dart';
import 'package:weather_app/widgets/no_weather.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    if(args != null)
      print(args['cityName']);
  
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed:() {
              Navigator.pushNamed(context, '/search');
            },
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Color(0xff1f9aff),
        title: Text(
          "Weather App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: args == null 
      ? NoWeather()
      : Container(
        child: Text(
          args['cityName'],
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
