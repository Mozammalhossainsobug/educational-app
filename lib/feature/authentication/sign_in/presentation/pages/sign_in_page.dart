import 'package:education_app/core/base/state.dart';
import 'package:education_app/core/route/route.dart';
import 'package:education_app/core/utils/colors.dart';
import 'package:education_app/core/widgets/button.dart';
import 'package:education_app/feature/authentication/sign_in/presentation/riverpods/sign_in_provider.dart';
import 'package:education_app/feature/authentication/sign_in/presentation/widgets/sign_in_form_builder.dart';
import 'package:education_app/feature/authentication/sign_up/presentation/widgets/logo_title.dart';
import 'package:education_app/feature/dashboard/presentation/riverpods/user_course_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final notifier = ref.read(signInProvider.notifier);
    final state = ref.watch(signInProvider);

    ref.listen(
      signInProvider,
      (previous, next) {
        if (next.status == BaseStatus.failure) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Oops...',
            text: next.error,
          );
        } else if (next.status == BaseStatus.success) {
          ref.read(userCourseProvider.notifier).getAllCourse();
          final state = ref.watch(userCourseProvider);
          _navigateToDashboardPage(state.data);
        }
      },
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const LogoAndTitle(title: 'Welcome Back'),
          Text(
            'Login to continue',
            style: TextStyle(
              color: UIColors.branda,
              fontSize: 11.h,
              height: 2,
            ),
          ),
          const SignInFormBuildUp(),
          Button(
            width: size.width * .9,
            onPressed: () => notifier.signUp(),
            isLoading: state.status == BaseStatus.loading,
            label: 'LOG IN',
            background: UIColors.branda,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _navigateToSignUpPage();
                  },
                  child: const Text(
                    'Sign up now',
                    style: TextStyle(
                      color: UIColors.branda,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _navigateToSignUpPage() {
    Navigator.popAndPushNamed(context, Routes.signUp);
  }

  void _navigateToDashboardPage(dynamic course) {
    Navigator.popAndPushNamed(
      context,
      Routes.dashboard,
      arguments: course,
    );
  }
}
