import 'dart:ui';

class CourseEntity {
  CourseEntity({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.chapter,
    required this.finished,
    required this.item,
  });

  String imageUrl;
  String name;
  String category;
  int chapter;
  double finished;
  int item;
}
