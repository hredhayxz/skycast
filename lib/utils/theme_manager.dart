import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeManager {
  ThemeManager._();

  static ThemeData getAppTheme() {
    return ThemeData(
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: Colors.white,
          fontSize: 32.sp,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: TextStyle(
          color: Colors.white,
          fontSize: 12.sp,
          fontFamily: 'Circular Std',
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
          fontFamily: 'Circular Std',
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontFamily: 'Circular Std',
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.white54,
        size: 16.r,
      ),
      colorScheme: ColorScheme.dark(
        primary: Colors.white,
        secondary: Colors.white.withOpacity(0.5),
      ),
    );
  }
}
