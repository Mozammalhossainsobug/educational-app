import 'package:education_app/core/utils/colors.dart';
import 'package:education_app/core/widgets/input_form_field.dart';
import 'package:education_app/feature/Authentication/sign_in/presentation/riverpods/sign_in_provider.dart';
import 'package:education_app/feature/Authentication/sign_up/presentation/riverpods/sign_up_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInFormBuildUp extends ConsumerStatefulWidget {
  const SignInFormBuildUp({super.key});

  @override
  ConsumerState consumerState() => _SignInFormBuildUpState();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SignInFormBuildUpState();
  }
}

class _SignInFormBuildUpState extends ConsumerState<SignInFormBuildUp> {
  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(signInProvider.notifier);
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 60, 28, 0),
      child: Column(
        children: [
          InputFormField(
            textEditingController: notifier.emailController,
            prefix: const Icon(
              Icons.email_outlined,
              color: UIColors.branda,
              size: 25,
            ),
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
            textEditingController: notifier.passwordController,
            prefix: const Icon(
              Icons.lock_outline,
              color: UIColors.branda,
              size: 25,
            ),
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
            password: EnabledPassword(),
            keyboardType: TextInputType.visiblePassword,
            borderType: BorderType.outlined,
          ),
        ],
      ),
    );
  }
}
