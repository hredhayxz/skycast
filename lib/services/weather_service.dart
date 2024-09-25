import 'dart:convert';
import 'package:http/http.dart';
import 'package:skycast/models/weather_model.dart';
import 'package:skycast/utils/constants.dart';

class WeatherService {
  Future<WeatherModel> getWeather(double latitude, double longitude) async {
    final url = Uri.parse(
        '${Constants.baseUrl}/forecast.json?key=${Constants.apiKey}&q=$latitude,$longitude&days=3');

    try {
      final response = await get(url);

      if (response.statusCode == 200) {
        try {
          return WeatherModel.fromJson(jsonDecode(response.body));
        } catch (e) {
          throw Exception('Failed to parse weather data: $e');
        }
      } else {
        throw Exception(
            'Failed to load weather data: HTTP ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
