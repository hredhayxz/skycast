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

  double convertToFahrenheit(double celsius) {
    return (celsius * 9 / 5) + 32;
  }
}
