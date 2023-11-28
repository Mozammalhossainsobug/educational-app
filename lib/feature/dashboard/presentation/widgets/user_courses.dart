import 'package:education_app/core/utils/colors.dart';
import 'package:education_app/feature/dashboard/domain/entities/course_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserCourses extends ConsumerWidget {
  const UserCourses({super.key, required this.userCourse});

  final List<CourseEntity> userCourse;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<CourseEntity> courses = userCourse;
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Your Courses',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            Row(
              children: [
                Text(
                  'SEE ALL',
                  style: TextStyle(
                    color: UIColors.branda,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: UIColors.branda,
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        courses.isNotEmpty
            ? SizedBox(
                height: 250,
                child: ListView.builder(
                  itemCount: courses.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final course = courses[index];
                    return SizedBox(
                      width: size.width * .8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Card(
                          elevation: 5,
                          shadowColor: Colors.black,
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                    child: Image.asset(
                                      course.imageUrl,
                                      height: size.height * .19,
                                      width: size.width,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            30.h, 10.h, 10.h, 0),
                                        child: Column(
                                          children: [
                                            Text(
                                              course.chapter.toString(),
                                              style: const TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const Text(
                                              'Chapters',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            30.h, 10.h, 0, 0),
                                        child: Column(
                                          children: [
                                            Text(
                                              course.item.toString(),
                                              style: const TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const Text(
                                              'Items',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Positioned(
                                bottom: 40.h,
                                right: 10.h,
                                child: CircleAvatar(
                                  radius: 25.h,
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 30.h,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            : Container(),
      ],
    );
  }
}
