import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skycast/controllers/weather_controller.dart';
import 'package:skycast/models/weather_model.dart';

// Provider for WeatherController instance
final weatherControllerProvider = Provider((ref) => WeatherController());

// FutureProvider that fetches weather data based on the search query
final weatherProvider = FutureProvider<WeatherModel>((ref) async {
  final weatherController = ref.watch(weatherControllerProvider);
  final searchQuery = ref.watch(weatherSearchQueryProvider.notifier).state;
  return weatherController.getWeatherData(searchQuery: searchQuery);
});

// StateProvider for managing the weather search query state
final weatherSearchQueryProvider = StateProvider<String?>((ref) => null);

// StateProvider for managing the selected day
final weatherDayProvider = StateProvider<int>((ref) => 0);

// StateProvider for managing search field state
final searchFieldProvider = StateProvider<bool>((ref) => false);

// StateProvider for managing the temperature unit
final temperatureUnitProvider =
    StateProvider<TemperatureUnit>((ref) => TemperatureUnit.celsius);

// Enum for temperature units
enum TemperatureUnit { celsius, fahrenheit }
