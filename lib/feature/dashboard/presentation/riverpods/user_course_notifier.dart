import 'package:education_app/core/base/state.dart';
import 'package:education_app/feature/dashboard/domain/entities/course_entity.dart';
import 'package:education_app/feature/dashboard/domain/use_cases/user_courses_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserCourseNotifier extends StateNotifier<BaseState> {
  UserCourseNotifier(this.userCourseUseCase) : super(const BaseState());
  final UserCourseUseCase userCourseUseCase;
  @override
  BaseState build() {
    return const BaseState();
  }

  void getAllCourse() {
    try {
      final userCourse = userCourseUseCase.call();
      state = state.copyWith(
        status: BaseStatus.success,
        data: userCourse,
      );
    } catch (e) {
      state = state.copyWith(
        status: BaseStatus.failure,
        error: e.toString(),
      );
    }
  }
}
