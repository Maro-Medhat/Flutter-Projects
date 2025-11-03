import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String apiKey = "76a91334f75449da93d215644252010";
  String baseUrl = "http://api.weatherapi.com/v1/";
  String endPoint = "forcast.json";

  Future<WeatherModel> getWeather({required cityName}) async {
    Uri url = Uri.parse("${baseUrl}${endPoint}?key=${apiKey}&q=${cityName}");
    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
  }
}
