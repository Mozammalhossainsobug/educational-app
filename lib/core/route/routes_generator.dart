import 'package:education_app/core/route/route.dart';
import 'package:education_app/feature/Authentication/sign_in/presentation/pages/sign_in_page.dart';
import 'package:education_app/feature/Authentication/sign_up/presentation/pages/sign_up_page.dart';
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

      // case Routes.home:
      //   return MaterialPageRoute(
      //     builder: (_) => const HomePage(),
      //   );
      //
      // case Routes.forgotPassword:
      //   return MaterialPageRoute(
      //     builder: (_) => const ForgotPasswordPage(),
      //   );
      //
      // case Routes.welcome:
      //   return MaterialPageRoute(builder: (_) => const SuccessPage());
      //
      // case Routes.webView:
      //   return MaterialPageRoute(
      //     builder: (_) => WebViewPage(
      //       url: routeSettings.arguments! as String,
      //     ),
      //   );
      //
      // case Routes.resetPassword:
      //   return MaterialPageRoute(
      //     builder: (_) => const SetNewPasswordPage(),
      //   );
      //
      // case Routes.changePassword:
      //   return MaterialPageRoute(
      //     builder: (_) => const ChangePasswordPage(),
      //   );
      //
      // case Routes.updateProfile:
      //   return MaterialPageRoute(
      //     builder: (_) => const UpdateProfilePage(),
      //   );
      //
      // case Routes.identityVerification:
      //   final arguments = routeSettings.arguments! as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //     builder: (_) => IdentityVerificationPage(
      //       isFromSignUp: arguments['isFromSignUp'] as bool,
      //     ),
      //   );

      default:
        return null;
    }
  }
}
