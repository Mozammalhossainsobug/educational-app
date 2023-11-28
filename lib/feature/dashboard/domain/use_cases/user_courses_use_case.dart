import 'package:education_app/feature/dashboard/domain/entities/course_entity.dart';
import 'package:education_app/feature/dashboard/domain/repositories/course_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userCourseUseCaseProvider = Provider<UserCourseUseCase>((ref) {
  final repository = ref.read(userCourseRepositoryProvider);
  return UserCourseUseCase(repository: repository);
});

class UserCourseUseCase {
  UserCourseUseCase({required this.repository});
  final UserCourseRepository repository;

  List<CourseEntity> call() {
    return repository.yourCourses();
  }
}
