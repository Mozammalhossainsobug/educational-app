import 'package:education_app/core/utils/assets.dart';
import 'package:education_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoAndTitle extends StatelessWidget {
  const LogoAndTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        children: [
          SizedBox(
            height: size.height * .1,
          ),
          Image.asset(
            Assets.appLogo,
            scale: 4,
          ),
          SizedBox(
            height: size.height * .05,
          ),
          Text(
            title,
            style: const TextStyle(
              color: UIColors.branda,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
