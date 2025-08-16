import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/l10n/translations/app_localizations.dart';

class ResetPasswordWidget extends StatelessWidget {
  const ResetPasswordWidget({
    super.key,
    required this.resetPassword,
    required this.emailController,
    required this.newPassController,
  });

  final void Function() resetPassword;
  final TextEditingController emailController;
  final TextEditingController newPassController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.reset_password,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(fontSize: 18.sp),
        ),
        verticalSpace(16),
        Text(
          AppLocalizations.of(context)!.password_validation,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        verticalSpace(32),
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.email,
            hintText: AppLocalizations.of(context)!.enter_your_email,
          ),
        ),
        verticalSpace(24),
        TextFormField(
          controller: newPassController,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.new_password,
            hintText: AppLocalizations.of(context)!.new_password,
          ),
        ),
        verticalSpace(48),
        ElevatedButton(
          onPressed: resetPassword,
          child: Text(AppLocalizations.of(context)!.continue_word),
        ),
      ],
    );
  }
}
