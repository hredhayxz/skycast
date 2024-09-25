import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skycast/providers/weather_provider.dart';
import 'package:skycast/views/widgets/weather_details.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(weatherProvider);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFF6380D0), Color(0xFF335AC7)],
          ),
        ),
        child: weatherData.when(
          data: (weather) => WeatherDetails(weather: weather),
          loading: () => const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
          error: (error, stack) => Padding(
            padding: EdgeInsets.all(27.r),
            child: Center(
              child: Text('Error: $error'),
            ),
          ),
        ),
      ),
    );
  }
}
