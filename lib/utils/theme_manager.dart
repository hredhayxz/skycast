import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skycast/utils/dimens.dart';

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
      inputDecorationTheme: InputDecorationTheme(
        contentPadding:
            EdgeInsets.symmetric(horizontal: radius27, vertical: radius8),
        filled: true,
        fillColor: Colors.grey[200],
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(100),
            right: Radius.circular(100),
          ),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(color: Colors.grey[600]),
      ),
    );
  }
}
