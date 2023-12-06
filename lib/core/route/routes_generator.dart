import 'package:education_app/core/route/route.dart';
import 'package:education_app/feature/Authentication/sign_in/presentation/pages/sign_in_page.dart';
import 'package:education_app/feature/Authentication/sign_up/presentation/pages/sign_up_page.dart';
import 'package:education_app/feature/dashboard/domain/entities/course_entity.dart';
import 'package:education_app/feature/dashboard/presentation/pages/dashboard_page.dart';
import 'package:education_app/feature/playlist/domain/entities/video_entity.dart';
import 'package:education_app/feature/playlist/presentation/pages/playlist_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static void get controller {}

  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUpPage(),
        );

      case Routes.signIn:
        return MaterialPageRoute(
          builder: (_) => const SignInPage(),
        );

      case Routes.dashboard:
        return MaterialPageRoute(
          builder: (_) => DashboardPage(
            courses: routeSettings.arguments! as List<CourseEntity>,
          ),
        );

      case Routes.playlist:
        return MaterialPageRoute(
          builder: (_) => PlayListPage(
            playlist: routeSettings.arguments! as List<VideoEntity>,
          ),
        );

      default:
        return null;
    }
  }
}
