import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skycast/utils/dimens.dart';

class DayButtonWidget extends StatelessWidget {
  const DayButtonWidget(
      {super.key,
      required this.btnName,
      required this.isActiveDay,
      required this.onTap});

  final String btnName;
  final bool isActiveDay;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
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
          btnName,
          textAlign: TextAlign.center,
          style:
              Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14.sp),
        ),
      ),
    );
  }
}
