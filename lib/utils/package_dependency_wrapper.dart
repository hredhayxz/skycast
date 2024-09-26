import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Wrapper {
  Wrapper._();

  /// For Cached Network image
  static Widget setCachedNetworkImage({
    required String imageUrl,
    double? width,
    double? height,
    BoxFit fit = BoxFit.fill,
    Color placeholderColor = Colors.grey,
    IconData errorIcon = Icons.error,
  }) {
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: fit,
      placeholder: (_, __) => CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 2.w,
      ),
      imageUrl: imageUrl,
      errorWidget: (_, __, ___) => Icon(errorIcon),
    );
  }
}
