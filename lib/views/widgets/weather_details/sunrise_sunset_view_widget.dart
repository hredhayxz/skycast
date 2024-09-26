import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skycast/controllers/weather_controller.dart';
import 'package:skycast/models/weather_model.dart';
import 'package:skycast/utils/dimens.dart';

class SunriseSunsetViewWidget extends StatelessWidget {
  const SunriseSunsetViewWidget({
    super.key,
    required this.weather,
    required this.day,
    required this.weatherController,
  });

  final WeatherModel weather;
  final int day;
  final WeatherController weatherController;

  @override
  Widget build(BuildContext context) {
    final sunriseTime =
        weather.forecast?.forecastday?[day].astro?.sunrise ?? '';
    final sunsetTime = weather.forecast?.forecastday?[day].astro?.sunset ?? '';

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
                            text: sunsetTime.split(' ')[0],
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: sunsetTime.split(' ')[1],
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
                            text: sunriseTime.split(' ')[0],
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontSize: 24.sp),
                          ),
                          TextSpan(
                            text: sunriseTime.split(' ')[1],
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
                      weatherController.uvIndexLevel(
                        (day == 0
                                    ? weather.current?.uv
                                    : weather
                                        .forecast?.forecastday?[day].day?.uv)
                                ?.toDouble() ??
                            0,
                      ),
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
}
