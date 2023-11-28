import 'package:education_app/core/utils/assets.dart';
import 'package:education_app/feature/dashboard/data/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'user_course_data_source_impl.dart';

final userCourseDataSourceProvider = Provider<UserCourseDataSource>(
  (ref) => UserCourseDataSourceImp(),
);

abstract class UserCourseDataSource {
  List<CourseModel> yourCourses();
}
