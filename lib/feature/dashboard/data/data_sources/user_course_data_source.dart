import 'package:education_app/feature/dashboard/data/models/course_model.dart';
import 'package:education_app/feature/playlist/domain/entities/video_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'user_course_data_source_impl.dart';

final userCourseDataSourceProvider = Provider<UserCourseDataSourceImp>(
  (ref) => UserCourseDataSourceImp(),
);

abstract class UserCourseDataSource {
  List<CourseModel> yourCourses();
}
