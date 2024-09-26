import 'package:flutter/material.dart';
import 'package:skycast/models/weather_model.dart';
import 'package:skycast/utils/dimens.dart';
import 'package:skycast/views/widgets/weather_details/hourly_weather_card.dart';

class HourlyWeatherWidget extends StatelessWidget {
  const HourlyWeatherWidget({
    super.key,
    required this.weather,
    required this.day,
  });

  final WeatherModel weather;
  final int day;

  @override
  Widget build(BuildContext context) {
    final totalHours = weather.forecast?.forecastday?[day].hour?.length ?? 0;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(totalHours, (index) {
          final hourlyForecast =
              weather.forecast?.forecastday?[day].hour?[index];
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? width16 : width6,
              right: index == totalHours - 1 ? width16 : width6,
            ),
            child: HourlyWeatherCard(hourlyForecast: hourlyForecast!, day: day),
          );
        }),
      ),
    );
  }
}
