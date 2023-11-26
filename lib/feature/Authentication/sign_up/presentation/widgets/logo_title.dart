import 'package:education_app/core/utils/assets.dart';
import 'package:education_app/core/utils/colors.dart';
import 'package:education_app/core/widgets/input_form_field.dart';
import 'package:flutter/material.dart';

class LogoAndTitle extends StatelessWidget {
  const LogoAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: Image.asset(
              Assets.appLogo,
            ),
          ),
          const Text(
            'Create an Account',
            style: TextStyle(
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
