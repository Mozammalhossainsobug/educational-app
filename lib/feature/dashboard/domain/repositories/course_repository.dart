import 'package:education_app/feature/dashboard/data/data_sources/user_course_data_source.dart';
import 'package:education_app/feature/dashboard/data/repositories/user_course_repository_impl.dart';
import 'package:education_app/feature/dashboard/domain/entities/course_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userCourseRepositoryProvider = Provider<UserCourseRepositoryImp>(
  (ref) {
    final dataSource = ref.read(userCourseDataSourceProvider);
    return UserCourseRepositoryImp(
      dataSource: dataSource,
    );
  },
);

abstract class UserCourseRepository {
  List<CourseEntity> yourCourses();
}
