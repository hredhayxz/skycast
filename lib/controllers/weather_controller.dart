import 'package:intl/intl.dart';
import 'package:skycast/models/weather_model.dart';
import 'package:skycast/services/location_service.dart';
import 'package:skycast/services/weather_service.dart';

class WeatherController {
  final WeatherService _weatherService = WeatherService();
  final LocationService _locationService = LocationService();

  Future<WeatherModel> getWeatherData() async {
    try {
      final position = await _locationService.getCurrentLocation();
      final weather = await _weatherService.getWeather(
          position.latitude, position.longitude);

      return weather;
    } catch (e) {
      throw Exception('Failed to get weather data: $e');
    }
  }

  /// Function to convert date-time string to formatted time
  String formatDateTime(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    return DateFormat('h a').format(dateTime);
  }

  /// Check for current hour or not
  bool isCurrentHour(int time) {
    final DateTime givenTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    final DateTime now = DateTime.now();

    return givenTime.hour == now.hour;
  }

  /// Function to determine UV type
  String uvIndexLevel(double uvIndex) {
    String level;

    switch (uvIndex.toInt()) {
      case 0:
      case 1:
      case 2:
        level = "${uvIndex.toInt()} Low";
        break;
      case 3:
      case 4:
      case 5:
        level = "${uvIndex.toInt()} Moderate";
      case 6:
      case 7:
        level = "${uvIndex.toInt()} High";
        break;
      case 8:
      case 9:
      case 10:
        level = "${uvIndex.toInt()} Very High";
        break;
      default:
        level = "${uvIndex.toInt()} Extreme";
        break;
    }

    return level;
  }
}
