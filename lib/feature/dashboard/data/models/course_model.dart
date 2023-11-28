import 'package:education_app/feature/dashboard/domain/entities/course_entity.dart';

class CourseModel extends CourseEntity {
  CourseModel({
    required super.name,
    required super.category,
    required super.imageUrl,
    required super.chapter,
    required super.finished,
    required super.item,
  });
}
