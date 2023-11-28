import 'package:education_app/core/base/state.dart';
import 'package:education_app/feature/dashboard/domain/use_cases/user_courses_use_case.dart';
import 'package:education_app/feature/dashboard/presentation/riverpods/user_course_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userCourseProvider = StateNotifierProvider<UserCourseNotifier, BaseState>(
  (ref) => UserCourseNotifier(
    ref.watch(userCourseUseCaseProvider),
  ),
);
