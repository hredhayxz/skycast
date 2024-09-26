import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skycast/models/weather_model.dart';
import 'package:skycast/providers/weather_provider.dart';
import 'package:skycast/utils/dimens.dart';
import 'package:skycast/utils/image_utils.dart';

class HourlyWeatherCard extends ConsumerWidget {
  const HourlyWeatherCard({
    super.key,
    required this.hourlyForecast,
    required this.day,
  });

  final Hour hourlyForecast;
  final int day;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tempUnit = ref.watch(temperatureUnitProvider);
    final weatherController = ref.watch(weatherControllerProvider);
    final temperature = tempUnit == TemperatureUnit.celsius
        ? '${hourlyForecast.tempC ?? 0}°'
        : '${hourlyForecast.tempF ?? 0}°';
    final iconUrl = 'https:${hourlyForecast.condition?.icon ?? ''}';

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: radius8, vertical: radius16),
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withOpacity(0.3),
                Colors.white.withOpacity(0)
              ],
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: width1P5,
                strokeAlign: BorderSide.strokeAlignInside,
                color: Colors.grey.withOpacity(0.2),
              ),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                weatherController
                    .formatDateTime(hourlyForecast.timeEpoch?.toInt() ?? 0),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: height8),
              ImageUtils.setCachedNetworkImage(
                imageUrl: iconUrl,
                width: height49,
                height: height49,
              ),
              SizedBox(height: height8),
              Text(
                temperature,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
        SizedBox(
          height: height8,
        ),
        ((day == 0) &&
                (weatherController
                    .isCurrentHour(hourlyForecast.timeEpoch?.toInt() ?? 0)))
            ? Container(
                width: height12,
                height: height12,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: OvalBorder(),
                ),
              )
            : SizedBox(
                height: height12,
              ),
      ],
    );
  }
}
