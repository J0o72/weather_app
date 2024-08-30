import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String apiKey = "bb53f5f45602406caa5211123240808";
  String baseUrl = "http://api.weatherapi.com/v1";

  Future<WeatherModel> getWeatherDate({required String cityName}) async {
    Uri url =
        Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7");

    http.Response response = await http.get(url);

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(jsonData);

    return weather;
  }
}
