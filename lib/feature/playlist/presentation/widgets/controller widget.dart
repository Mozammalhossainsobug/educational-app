import 'package:education_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ControllerWidget extends StatefulWidget {
  const ControllerWidget({super.key});

  @override
  State<ControllerWidget> createState() => _ControllerWidgetState();
}

class _ControllerWidgetState extends State<ControllerWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
        bottom: size.height * .06,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width * .4,
            margin: EdgeInsets.only(left: 20.h),
            padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.green,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.playlist_add,
                  color: Colors.green,
                ),
                SizedBox(width: 3),
                Text(
                  'Text Syllabus',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: size.width * .4,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: EdgeInsets.only(right: 10.w),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Image.asset(
                      Assets.backIcon,
                      width: 25,
                      height: 25,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 5, 5, 5),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        const Text('Next'),
                        Image.asset(
                          Assets.forwardIcon,
                          width: 25,
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
