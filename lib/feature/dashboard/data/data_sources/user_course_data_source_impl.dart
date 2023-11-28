part of 'user_course_data_source.dart';

class UserCourseDataSourceImp extends UserCourseDataSource {
  @override
  List<CourseModel> yourCourses() {
    return [
      CourseModel(
        name: 'ReactJs',
        category: 'Programming',
        imageUrl: 'assets/images/react_js_course_cover.png',
        chapter: 13,
        finished: 0.0,
        item: 4,
      ),
      CourseModel(
        name: 'JavaScript',
        category: 'Programming',
        imageUrl: 'assets/images/javascript_course_cover.png',
        chapter: 12,
        finished: 0,
        item: 3,
      )
    ];
  }
}
