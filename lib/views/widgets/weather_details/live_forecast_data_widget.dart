import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skycast/models/weather_model.dart';
import 'package:skycast/providers/weather_provider.dart';
import 'package:skycast/utils/dimens.dart';
import 'package:skycast/utils/image_utils.dart';

class LiveForecastDataWidget extends StatelessWidget {
  const LiveForecastDataWidget({
    super.key,
    required this.day,
    required this.tempUnit,
    required this.weather,
  });

  final int day;
  final TemperatureUnit tempUnit;
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FittedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: radius27),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageUtils.setCachedNetworkImage(
                  imageUrl: day == 0
                      ? 'https:${weather.current?.condition?.icon}'
                      : 'https:${weather.forecast!.forecastday?[day].day?.condition?.icon}',
                  height: height130,
                  width: height135,
                ),
                SizedBox(
                  width: width24,
                ),
                Text(
                  day == 0
                      ? tempUnit == TemperatureUnit.celsius
                          ? '${weather.current?.tempC ?? 0}°'
                          : '${weather.current?.tempF ?? 0}°'
                      : tempUnit == TemperatureUnit.celsius
                          ? '${weather.forecast!.forecastday?[day].day?.avgtempC ?? 0}°'
                          : '${weather.forecast!.forecastday?[day].day?.avgtempF ?? 0}°',
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 122.sp,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ],
            ),
          ),
        ),
        Text(
          day == 0
              ? tempUnit == TemperatureUnit.celsius
                  ? '${weather.current?.condition?.text ?? ''}  -  H:${weather.current?.heatindexC ?? 0}°  FL: ${weather.current?.feelslikeC ?? 0}°'
                  : '${weather.current?.condition?.text ?? ''}  -  H:${weather.current?.heatindexF ?? 0}°  FL: ${weather.current?.feelslikeF ?? 0}°'
              : tempUnit == TemperatureUnit.celsius
                  ? '${weather.forecast!.forecastday?[day].day?.condition?.text ?? ''}  -  H:${weather.forecast!.forecastday?[day].day?.maxtempC ?? 0}°  FL: ${weather.forecast!.forecastday?[day].day?.avgtempC ?? 0}°'
                  : '${weather.forecast!.forecastday?[day].day?.condition?.text ?? ''}  -  H:${weather.forecast!.forecastday?[day].day?.maxtempF ?? 0}°  FL: ${weather.forecast!.forecastday?[day].day?.avgtempF ?? 0}°',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
