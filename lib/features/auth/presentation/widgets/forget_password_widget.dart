import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helpers/spacing.dart';
import 'package:online_exam/core/helpers/validators.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({
    super.key,
    required this.sendCode,
    required this.formKey,
    required this.emailController,
  });

  final void Function() sendCode;
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.forget_password,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(fontSize: 18.sp),
        ),
        verticalSpace(16),
        Text(
          AppLocalizations.of(context)!.enter_associated_email,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        verticalSpace(32),
        Form(
          key: formKey,
          child: TextFormField(
            controller: emailController,
            validator: Validations.validateEmail,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.email,
              hintText: AppLocalizations.of(context)!.enter_your_email,
            ),
          ),
        ),
        verticalSpace(48),
        ElevatedButton(
          onPressed: sendCode,
          child: Text(AppLocalizations.of(context)!.continue_word),
        ),
      ],
    );
  }
}
