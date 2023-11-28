import 'package:education_app/core/utils/assets.dart';
import 'package:education_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferCardWidget extends StatelessWidget {
  const OfferCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          height: 150.h,
          width: size.width,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: UIColors.branda,
            borderRadius: BorderRadius.circular(
                20), // Adjust the value for your desired border radius
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            Assets.offerBackgroundTop,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            Assets.offerBackgroundBottom,
          ),
        ),
        Positioned(
          top: 10.h,
          right: 15.h,
          child: Image.asset(
            Assets.designOffer,
          ),
        ),
        Positioned(
          top: 30.h,
          left: 25.h,
          child: const Text(
            '25% OFF',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: 44.h,
          left: 25.h,
          child: const Text(
            "Today's Special",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: 84.h,
          left: 25.h,
          child: const Text(
            "Get a Discount for Every \nCourse Order only valid for\nToday.!",
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
