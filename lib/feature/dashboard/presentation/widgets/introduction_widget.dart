import 'package:education_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, ALEX',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 28,
              ),
            ),
            Text(
              'What would you like to learn today?',
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
            Text(
              'Search Below',
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: UIColors.branda, // Replace with your desired border color
              width: 2.0, // Replace with your desired border width
            ),
          ),
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25,
            child: Icon(
              Icons.notifications_none,
            ),
          ),
        )
      ],
    );
  }
}
