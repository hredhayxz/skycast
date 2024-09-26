import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skycast/controllers/weather_controller.dart';
import 'package:skycast/models/weather_model.dart';
import 'package:skycast/providers/weather_provider.dart';

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
              height: 40.h,
            ),
            Text(
              weather.location?.name ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.location_on_rounded,
                  size: 16.r,
                  color: Colors.white54,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  'Current Location',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontFamily: 'Circular Std',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),

            /// Live forecast data view
            _liveForecastData(day: day),
            SizedBox(
              height: 32.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                _dayButton(btnName: 'Today', isActiveDay: day == 0, ref: ref),
                SizedBox(
                  width: 8.w,
                ),
                _dayButton(
                    btnName: 'Next Day', isActiveDay: day != 0, ref: ref),
              ],
            ),
            SizedBox(
              height: 25.h,
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
                      left: index == 0 ? 16.w : 6.w,
                      right: index == 23 ? 16.w : 6.w,
                    ),
                    child: _hourlyWeatherCard(
                        hourlyForecast:
                            weather.forecast!.forecastday![day].hour![index],
                        day: day,
                        weatherController: weatherController),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),

            /// Sunrise & Sunset view
            _sunriseSunsetView(day: day, weatherController: weatherController),
          ],
        ),
      ),
    );
  }

  /// Live forecast data view
  Widget _liveForecastData({required int day}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FittedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  day == 0
                      ? 'https:${weather.current?.condition?.icon}'
                      : 'https:${weather.forecast!.forecastday?[day].day?.condition?.icon}',
                  height: 130.h,
                  width: 135.h,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 27.w,
                ),
                Text(
                  day == 0
                      ? '${weather.current?.tempC ?? 0}°'
                      : '${weather.forecast!.forecastday?[day].day?.avgtempC ?? 0}°',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 122.71.sp,
                    fontFamily: 'Circular Std',
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
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontFamily: 'Circular Std',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  /// Sunrise & Sunset view
  Widget _sunriseSunsetView(
      {required int day, required WeatherController weatherController}) {
    return Container(
      padding: EdgeInsets.all(30.r),
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
            height: 60.h,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 16.r),
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
                  width: 1.5.w,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: Colors.white.withOpacity(0.2),
                ),
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/sunrise_and_sunset.png',
                  height: 56.h,
                  width: 56.h,
                  fit: BoxFit.fill,
                ),
                SizedBox(width: 24.w),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sunset',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontFamily: 'Circular Std',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: weather
                                    .forecast!.forecastday?[day].astro?.sunset
                                    ?.split(' ')[0] ??
                                '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.sp,
                              fontFamily: 'Circular Std',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: weather
                                    .forecast!.forecastday?[day].astro?.sunset
                                    ?.split(' ')[1] ??
                                '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontFamily: 'Circular Std',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 24.w),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Sunrise',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontFamily: 'Circular Std',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: weather
                                    .forecast!.forecastday?[day].astro?.sunrise
                                    ?.split(' ')[0] ??
                                '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.sp,
                              fontFamily: 'Circular Std',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: weather
                                    .forecast!.forecastday?[day].astro?.sunrise
                                    ?.split(' ')[1] ??
                                '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontFamily: 'Circular Std',
                              fontWeight: FontWeight.w400,
                            ),
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
            height: 16.h,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 16.r),
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
                  width: 1.5.w,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: Colors.white.withOpacity(0.2),
                ),
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/uv_index_image.png',
                  height: 56.h,
                  width: 56.h,
                  fit: BoxFit.fill,
                ),
                SizedBox(width: 24.w),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'UV Index',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontFamily: 'Circular Std',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      weatherController.uvIndexLevel(weather
                              .forecast!.forecastday?[day].day?.uv
                              ?.toDouble() ??
                          0),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontFamily: 'Circular Std',
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
      {required String btnName, required isActiveDay, required WidgetRef ref}) {
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
        padding: EdgeInsets.symmetric(horizontal: 32.r, vertical: 12.r),
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
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  /// Hourly weather card
  Widget _hourlyWeatherCard(
      {required Hour hourlyForecast,
      required int day,
      required WeatherController weatherController}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 16.r),
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
                width: 1.5.w,
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
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontFamily: 'Circular Std',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8.h),
              Image.network(
                'https:${hourlyForecast.condition?.icon ?? ''}',
                width: 49.85.h,
                height: 48.h,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 8.h),
              Text(
                '${hourlyForecast.tempC ?? 0}°',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontFamily: 'Circular Std',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        ((day == 0) &&
                (weatherController
                    .isCurrentHour(hourlyForecast.timeEpoch?.toInt() ?? 0)))
            ? Container(
                width: 12.h,
                height: 12.h,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: OvalBorder(),
                ),
              )
            : SizedBox(
                height: 12.h,
              ),
      ],
    );
  }
}
