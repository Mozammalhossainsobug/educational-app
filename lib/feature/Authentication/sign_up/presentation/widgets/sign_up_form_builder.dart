import 'package:education_app/core/utils/colors.dart';
import 'package:education_app/core/widgets/input_form_field.dart';
import 'package:flutter/material.dart';

class SignUpFormBuildUp extends StatefulWidget {
  const SignUpFormBuildUp({super.key});

  @override
  State<SignUpFormBuildUp> createState() => _SignUpFormBuildUpState();
}

class _SignUpFormBuildUpState extends State<SignUpFormBuildUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Column(
        children: [
          InputFormField(
            textEditingController: nameController,
            label: const Padding(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              child: Text(
                'Name',
                style: TextStyle(
                  color: UIColors.branda,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            contentPadding: const EdgeInsets.only(left: 10),
            borderType: BorderType.outlined,
          ),
          InputFormField(
            textEditingController: emailController,
            label: const Padding(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              child: Text(
                'Email',
                style: TextStyle(
                  color: UIColors.branda,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            contentPadding: const EdgeInsets.only(left: 10),
            borderType: BorderType.outlined,
          ),
          InputFormField(
            textEditingController: passwordController,
            label: const Padding(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              child: Text(
                'Password',
                style: TextStyle(
                  color: UIColors.branda,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            contentPadding: const EdgeInsets.only(left: 10),
            borderType: BorderType.outlined,
          ),
          InputFormField(
            textEditingController: confirmPasswordController,
            label: const Padding(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              child: Text(
                'Confirm Password',
                style: TextStyle(
                  color: UIColors.branda,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            contentPadding: const EdgeInsets.only(left: 10),
            borderType: BorderType.outlined,
          ),
        ],
      ),
    );
  }
}
