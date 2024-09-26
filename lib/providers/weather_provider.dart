import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skycast/controllers/weather_controller.dart';
import 'package:skycast/models/weather_model.dart';

final weatherControllerProvider = Provider((ref) => WeatherController());

final weatherProvider = FutureProvider<WeatherModel>((ref) async {
  final weatherController = ref.watch(weatherControllerProvider);
  return weatherController.getWeatherData();
});

final weatherDayProvider = StateProvider<int>((ref) => 0);

final temperatureUnitProvider =
    StateProvider<TemperatureUnit>((ref) => TemperatureUnit.celsius);

enum TemperatureUnit { celsius, fahrenheit }
