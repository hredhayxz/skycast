import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skycast/controllers/weather_controller.dart';
import 'package:skycast/models/weather_model.dart';
import 'package:skycast/providers/weather_provider.dart';
import 'package:skycast/utils/dimens.dart';
import 'package:skycast/utils/package_dependency_wrapper.dart';

class WeatherDetails extends ConsumerWidget {
  const WeatherDetails({super.key, required this.weather});

  final WeatherModel weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final day = ref.watch(weatherDayProvider);
    final weatherController = ref.watch(weatherControllerProvider);

    return RefreshIndicator(
      onRefresh: () async => weatherController.getWeatherData(),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: height40,
            ),
            Text(
              weather.location?.name ?? '',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: height15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.location_on_rounded,
                ),
                SizedBox(
                  width: width8,
                ),
                Text(
                  'Current Location',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            SizedBox(
              height: height15,
            ),

            /// Live forecast data view
            _liveForecastData(day: day, context: context),
            SizedBox(
              height: height32,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                _dayButton(
                    btnName: 'Today',
                    isActiveDay: day == 0,
                    ref: ref,
                    context: context),
                SizedBox(
                  width: width8,
                ),
                _dayButton(
                    btnName: 'Next Day',
                    isActiveDay: day != 0,
                    ref: ref,
                    context: context),
              ],
            ),
            SizedBox(
              height: height25,
            ),

            /// Hourly weather data view
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    weather.forecast!.forecastday?[day].hour?.length ?? 0,
                    (index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? width16 : width6,
                      right: index == 23 ? width16 : width6,
                    ),
                    child: _hourlyWeatherCard(
                        hourlyForecast:
                            weather.forecast!.forecastday![day].hour![index],
                        day: day,
                        weatherController: weatherController,
                        context: context),
                  );
                }),
              ),
            ),
            SizedBox(
              height: height8,
            ),

            /// Sunrise & Sunset view
            _sunriseSunsetView(
                day: day,
                weatherController: weatherController,
                context: context),
          ],
        ),
      ),
    );
  }

  /// Live forecast data view
  Widget _liveForecastData({required int day, required BuildContext context}) {
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
                Wrapper.setCachedNetworkImage(
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
                      ? '${weather.current?.tempC ?? 0}°'
                      : '${weather.forecast!.forecastday?[day].day?.avgtempC ?? 0}°',
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 122.71.sp,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ],
            ),
          ),
        ),
        Text(
          day == 0
              ? '${weather.current?.condition?.text ?? ''}  -  H:${weather.current?.heatindexC ?? 0}°  FL: ${weather.current?.feelslikeC ?? 0}°'
              : '${weather.forecast!.forecastday?[day].day?.condition?.text ?? ''}  -  H:${weather.forecast!.forecastday?[day].day?.maxtempC ?? 0}°  FL: ${weather.forecast!.forecastday?[day].day?.avgtempC ?? 0}°',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }

  /// Sunrise & Sunset view
  Widget _sunriseSunsetView(
      {required int day,
      required WeatherController weatherController,
      required BuildContext context}) {
    return Container(
      padding: EdgeInsets.all(radius30),
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bottom_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: height60,
          ),
          Container(
            width: double.infinity,
            padding:
                EdgeInsets.symmetric(horizontal: radius8, vertical: radius16),
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.2),
                  Colors.grey.withOpacity(0.05)
                ],
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: width1P5,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: Colors.white.withOpacity(0.2),
                ),
                borderRadius: BorderRadius.circular(radius16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/sunrise_and_sunset.png',
                  height: height56,
                  width: height56,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: width24,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sunset',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: weather
                                    .forecast!.forecastday?[day].astro?.sunset
                                    ?.split(' ')[0] ??
                                '',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: weather
                                    .forecast!.forecastday?[day].astro?.sunset
                                    ?.split(' ')[1] ??
                                '',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: width24,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Sunrise',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: weather
                                    .forecast!.forecastday?[day].astro?.sunrise
                                    ?.split(' ')[0] ??
                                '',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontSize: 24.sp),
                          ),
                          TextSpan(
                            text: weather
                                    .forecast!.forecastday?[day].astro?.sunrise
                                    ?.split(' ')[1] ??
                                '',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: height15,
          ),
          Container(
            width: double.infinity,
            padding:
                EdgeInsets.symmetric(horizontal: radius8, vertical: radius16),
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.2),
                  Colors.grey.withOpacity(0.05)
                ],
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: width1P5,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: Colors.white.withOpacity(0.2),
                ),
                borderRadius: BorderRadius.circular(radius16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/uv_index_image.png',
                  height: height56,
                  width: height56,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: width24,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'UV Index',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white.withOpacity(0.5)),
                    ),
                    Text(
                      weatherController.uvIndexLevel(weather
                              .forecast!.forecastday?[day].day?.uv
                              ?.toDouble() ??
                          0),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Day button for change weather upto 3 days
  Widget _dayButton(
      {required String btnName,
      required isActiveDay,
      required WidgetRef ref,
      required BuildContext context}) {
    final day = ref.watch(weatherDayProvider);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (btnName == 'Today') {
          ref.read(weatherDayProvider.notifier).state = 0;
        } else {
          if (day < 2) {
            ref.read(weatherDayProvider.notifier).state++;
          }
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: radius32, vertical: radius12),
        decoration: ShapeDecoration(
          color: isActiveDay
              ? Colors.white.withOpacity(0.10000000149011612)
              : Colors.black.withOpacity(0.10000000149011612),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Text(
          (day == 2 && btnName != 'Today') ? 'Third Day' : btnName,
          textAlign: TextAlign.center,
          style:
              Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14.sp),
        ),
      ),
    );
  }

  /// Hourly weather card
  Widget _hourlyWeatherCard(
      {required Hour hourlyForecast,
      required int day,
      required WeatherController weatherController,
      required BuildContext context}) {
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
              Wrapper.setCachedNetworkImage(
                imageUrl: 'https:${hourlyForecast.condition?.icon ?? ''}',
                width: height49,
                height: height49,
              ),
              SizedBox(height: height8),
              Text(
                '${hourlyForecast.tempC ?? 0}°',
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
