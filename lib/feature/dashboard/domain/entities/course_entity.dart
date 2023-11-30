import 'dart:ui';

import 'package:education_app/feature/playlist/domain/entities/video_entity.dart';

class CourseEntity {
  CourseEntity({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.chapter,
    required this.finished,
    required this.item,
    required this.playlist,
  });

  String imageUrl;
  String name;
  String category;
  int chapter;
  double finished;
  int item;
  List<VideoEntity> playlist;
}
