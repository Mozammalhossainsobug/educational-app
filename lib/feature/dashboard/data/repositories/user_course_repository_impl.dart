import 'package:education_app/feature/dashboard/data/data_sources/user_course_data_source.dart';
import 'package:education_app/feature/dashboard/domain/entities/course_entity.dart';
import 'package:education_app/feature/dashboard/domain/repositories/course_repository.dart';

class UserCourseRepositoryImp extends UserCourseRepository {
  UserCourseRepositoryImp({required this.dataSource});
  final UserCourseDataSource dataSource;

  @override
  List<CourseEntity> yourCourses() {
    return dataSource.yourCourses();
  }
}
