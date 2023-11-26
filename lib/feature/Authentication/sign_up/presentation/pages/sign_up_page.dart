import 'package:education_app/feature/Authentication/sign_up/presentation/widgets/logo_title.dart';
import 'package:education_app/feature/Authentication/sign_up/presentation/widgets/sign_up_form_builder.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            LogoAndTitle(),
            SignUpFormBuildUp(),
          ],
        ),
      ),
    );
  }
}
