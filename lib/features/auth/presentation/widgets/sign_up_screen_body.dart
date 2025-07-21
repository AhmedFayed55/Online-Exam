import 'package:flutter/material.dart';
import 'package:online_exam/core/helpers/spacing.dart';
import 'package:online_exam/features/auth/presentation/widgets/custom_app_bar.dart';
import 'package:online_exam/features/auth/presentation/widgets/form_widget.dart';
import 'package:online_exam/features/auth/presentation/widgets/have_account.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        const CustomBackButton(),
        verticalSpace(24),
        const FormWidget(),
        verticalSpace(16),
        const AlreadyHaveAnAcoountWidget(),
      ],
    );
  }
}
