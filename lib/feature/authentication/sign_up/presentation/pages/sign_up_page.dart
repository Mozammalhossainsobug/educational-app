import 'package:education_app/core/base/state.dart';
import 'package:education_app/core/route/route.dart';
import 'package:education_app/core/utils/colors.dart';
import 'package:education_app/core/widgets/button.dart';
import 'package:education_app/core/widgets/snackbar.dart';
import 'package:education_app/feature/authentication/sign_up/presentation/riverpods/sign_up_provider.dart';
import 'package:education_app/feature/authentication/sign_up/presentation/widgets/logo_title.dart';
import 'package:education_app/feature/authentication/sign_up/presentation/widgets/sign_up_form_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signUpProvider);
    final notifier = ref.read(signUpProvider.notifier);
    final size = MediaQuery.of(context).size;

    ref.listen(
      signUpProvider,
      (previous, next) {
        if (next.status == BaseStatus.failure) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Oops...',
            text: next.error,
          );
        } else if (next.status == BaseStatus.success) {
          ShowSnackBarMessage.showSuccessSnackBar(
            message: 'Successfully Account created',
            context: context,
          );
          _navigateToSignInPage();
        }
      },
    );

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const LogoAndTitle(title: 'Create an Account'),
              const SignUpFormBuildUp(),
              Button(
                width: size.width * .9,
                onPressed: () => notifier.signUp(),
                isLoading: state.status == BaseStatus.loading,
                label: 'SIGN UP',
                background: UIColors.branda,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Have an account already?'),
                    GestureDetector(
                      onTap: () {
                        _navigateToSignInPage();
                      },
                      child: const Text(
                        'Log in',
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
        ),
      ),
    );
  }

  void _navigateToSignInPage() {
    Navigator.popAndPushNamed(context, Routes.signIn);
  }
}
