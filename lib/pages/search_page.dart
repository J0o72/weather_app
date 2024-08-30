import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  VoidCallback? updateUi;

  SearchPage({super.key, required this.updateUi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            onSubmitted: (data) async {
              cityName = data;

              WeatherService service = WeatherService();

              WeatherModel? weather =
                  await service.getWeatherDate(cityName: cityName!);

              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;

              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  data;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              hintText: "Type a city",
              border: OutlineInputBorder(),
              suffixIcon: GestureDetector(
                onTap: () async {
                  WeatherService service = WeatherService();

                  WeatherModel? weather =
                      await service.getWeatherDate(cityName: cityName!);

                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = weather;
                  Provider.of<WeatherProvider>(context, listen: false)
                      .cityName = cityName;

                  Navigator.pop(context);
                },
                child: Icon(Icons.search),
              ),
              label: Text("Search"),
            ),
          ),
        ),
      ),
    );
  }
}
