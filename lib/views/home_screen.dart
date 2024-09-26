import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skycast/providers/weather_provider.dart';
import 'package:skycast/utils/dimens.dart';
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
            padding: EdgeInsets.all(radius27),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Something went wrong!',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: height8,
                  ),
                  IconButton(
                    onPressed: () => ref.refresh(weatherProvider),
                    icon: Icon(
                      Icons.refresh,
                      color: Colors.red,
                      size: radius32,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
