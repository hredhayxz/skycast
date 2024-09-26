import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skycast/models/weather_model.dart';
import 'package:skycast/providers/weather_provider.dart';
import 'package:skycast/utils/dimens.dart';

class LocationInfoWidget extends ConsumerWidget {
  const LocationInfoWidget({
    super.key,
    required this.weather,
  });

  final WeatherModel weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchIsOn = ref.watch(searchFieldProvider);
    final tempUnit = ref.watch(temperatureUnitProvider);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (!searchIsOn)
                ? IconButton(
                    onPressed: () =>
                        ref.read(searchFieldProvider.notifier).state = true,
                    icon: Icon(
                      Icons.search,
                      size: radius32,
                      color: Colors.white,
                    ),
                  )
                : SizedBox(
                    width: height56,
                  ),
            Text(
              weather.location?.name ?? '',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            TextButton(
              onPressed: () =>
                  ref.read(temperatureUnitProvider.notifier).state =
                      tempUnit == TemperatureUnit.celsius
                          ? TemperatureUnit.fahrenheit
                          : TemperatureUnit.celsius,
              child: Text(
                tempUnit == TemperatureUnit.celsius ? '°C' : '°F',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => ref.refresh(weatherProvider),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.location_on_rounded),
              SizedBox(width: width8),
              Text(
                'Current Location',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
