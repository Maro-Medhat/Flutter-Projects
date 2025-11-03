import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xfffead3a),
        title: Text("Search a City", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: TextField(
            onSubmitted: (cityName) async {
              WeatherService service = WeatherService();
              print(await service.getWeather(cityName: cityName));

              Navigator.pushNamed(
                context,
                '/',
                arguments: {"cityName": cityName},
              );
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 10,
              ),
              label: Text("Search", style: TextStyle(color: Color(0xfffead3a))),
              hintText: "Enter City Name",
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(Icons.search),
              ),
              hintStyle: TextStyle(color: const Color.fromRGBO(0, 0, 0, 0.5)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xfffead3a)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xfffead3a)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
