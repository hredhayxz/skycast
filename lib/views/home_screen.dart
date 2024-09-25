import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6380D0),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFF6380D0), Color(0xFF335AC7)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Text(
                'Dhaka',
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
              FittedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.r),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        'https://via.placeholder.com/135x130',
                        height: 130.h,
                        width: 135.h,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: 27.w,
                      ),
                      Text(
                        '13°',
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
                'Partly Cloud  -  H:17o  L:4o',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontFamily: 'Circular Std',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 32.r, vertical: 12.r),
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.10000000149011612),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      'Today',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 32.r, vertical: 12.r),
                    decoration: ShapeDecoration(
                      color: Colors.black.withOpacity(0.10000000149011612),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      'Next Days',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(10, (index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 16.w : 6.w,
                        right: index == 9 ? 16.w : 6.w,
                      ),
                      child: _weatherCard(),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Container(
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.r, vertical: 16.r),
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
                          Image.network(
                            'https://via.placeholder.com/56x56',
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
                                      text: '5:51',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.sp,
                                        fontFamily: 'Circular Std',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'PM',
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
                          SizedBox(width: 32.w),
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
                                      text: '7:00',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.sp,
                                        fontFamily: 'Circular Std',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'AM',
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.r, vertical: 16.r),
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
                          Image.network(
                            'https://via.placeholder.com/56x56',
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
                                '1 Low',
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _weatherCard() {
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
                'Now',
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
                'https://via.placeholder.com/50x48',
                width: 49.85.h,
                height: 48.h,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 8.h),
              Text(
                '13°',
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
        Container(
          width: 12.h,
          height: 12.h,
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: OvalBorder(),
          ),
        ),
      ],
    );
  }
}
