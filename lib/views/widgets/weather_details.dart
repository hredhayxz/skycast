import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skycast/models/weather_model.dart';
import 'package:skycast/providers/weather_provider.dart';
import 'package:skycast/utils/dimens.dart';
import 'package:skycast/views/widgets/weather_details/day_button_widget.dart';
import 'package:skycast/views/widgets/weather_details/hourly_weather_widget.dart';
import 'package:skycast/views/widgets/weather_details/live_forecast_data_widget.dart';
import 'package:skycast/views/widgets/weather_details/location_info_widget.dart';
import 'package:skycast/views/widgets/weather_details/searchfield_widget.dart';
import 'package:skycast/views/widgets/weather_details/sunrise_sunset_view_widget.dart';

class WeatherDetails extends ConsumerWidget {
  const WeatherDetails({super.key, required this.weather});

  final WeatherModel weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final day = ref.watch(weatherDayProvider);
    final tempUnit = ref.watch(temperatureUnitProvider);
    final searchIsOn = ref.watch(searchFieldProvider);
    final weatherController = ref.watch(weatherControllerProvider);

    return RefreshIndicator(
      onRefresh: () async => ref.refresh(weatherProvider),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: height40),
            if (searchIsOn) const SearchFieldWidget(),
            SizedBox(height: height15),
            LocationInfoWidget(weather: weather),
            SizedBox(height: height15),
            LiveForecastDataWidget(
                day: day, tempUnit: tempUnit, weather: weather),
            SizedBox(height: height32),
            _buildDaySelector(ref, day),
            SizedBox(height: height25),
            HourlyWeatherWidget(weather: weather, day: day),
            SizedBox(height: height8),
            SunriseSunsetViewWidget(
                weather: weather,
                day: day,
                weatherController: weatherController),
          ],
        ),
      ),
    );
  }

  /// Day selector buttons (Today, Next Day & Third Day)
  Widget _buildDaySelector(WidgetRef ref, int day) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DayButtonWidget(
          btnName: 'Today',
          isActiveDay: day == 0,
          onTap: () => ref.read(weatherDayProvider.notifier).state = 0,
        ),
        SizedBox(width: width8),
        DayButtonWidget(
          btnName: day == 2 ? 'Third Day' : 'Next Day',
          isActiveDay: day != 0,
          onTap: () {
            if (day < 2) {
              ref.read(weatherDayProvider.notifier).state++;
            }
          },
        ),
      ],
    );
  }
}
