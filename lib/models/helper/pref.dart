import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:skycast/models/weather_model.dart';

class Pref {
  Pref._();

  static late Box _box;

  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('data');
  }

  /// Store weather data
  // Get weather data
  static WeatherModel get weatherData =>
      WeatherModel.fromJson(jsonDecode(_box.get('weatherData') ?? '{}'));

  // Set weather data
  static set weatherData(WeatherModel wd) =>
      _box.put('weatherData', jsonEncode(wd));
}
