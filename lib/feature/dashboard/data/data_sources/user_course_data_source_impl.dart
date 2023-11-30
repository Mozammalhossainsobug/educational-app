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
        playlist: [
          VideoEntity(
            'assets/videos/ReactJSModule_0.mp4',
            'What is React and How it works - React Tutorial Bangla Series',
            1,
            'Introduction',
          ),
          VideoEntity(
            'assets/videos/ReactJSModule_1.mp4',
            'React Virtual DOM Explained - Easy Explanation - React Tutorial Bangla Series',
            2,
            'Introduction',
          ),
          VideoEntity(
            'assets/videos/ReactJSModule_2.mp4',
            'ESLint, Formatting with Prettier & Project Setup - React Tutorial Bangla Series',
            3,
            'Introduction',
          ),
          VideoEntity(
            'assets/videos/ReactJSModule_3.mp4',
            'How to install react in 2023 - - React Tutorial Bangla Series',
            4,
            'Introduction',
          ),
        ],
      ),
      CourseModel(
        name: 'JavaScript',
        category: 'Programming',
        imageUrl: 'assets/images/javascript_course_cover.png',
        chapter: 12,
        finished: 0,
        item: 3,
        playlist: [
          VideoEntity(
            'assets/videos/ReactJSModule_0.mp4',
            'What is React and How it works - React Tutorial Bangla Series',
            1,
            'Introduction',
          ),
          VideoEntity(
            'assets/videos/ReactJSModule_1.mp4',
            'React Virtual DOM Explained - Easy Explanation - React Tutorial Bangla Series',
            1,
            'Introduction',
          ),
          VideoEntity(
            'assets/videos/ReactJSModule_2.mp4',
            'ESLint, Formatting with Prettier & Project Setup - React Tutorial Bangla Series',
            1,
            'Introduction',
          ),
          VideoEntity(
            'assets/videos/ReactJSModule_3.mp4',
            'How to install react in 2023 - - React Tutorial Bangla Series',
            1,
            'Introduction',
          ),
        ],
      ),
    ];
  }
}
