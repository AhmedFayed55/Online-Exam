import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helpers/spacing.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';
import 'package:online_exam/features/auth/presentation/widgets/custom_password_text_form_field.dart';

class PasswordRowFields extends StatefulWidget {
  const PasswordRowFields({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
    this.onPasswordChanged,
    this.onConfirmPasswordChanged,
    this.passwordValidator,
    this.confirmPasswordValidator,
  });

  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final void Function(String)? onPasswordChanged;
  final void Function(String)? onConfirmPasswordChanged;
  final String? Function(String?)? passwordValidator;
  final String? Function(String?)? confirmPasswordValidator;

  @override
  State<PasswordRowFields> createState() => _PasswordRowFieldsState();
}

class _PasswordRowFieldsState extends State<PasswordRowFields> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CustomPasswordTextFormField(
              controller: widget.passwordController,
              hint: AppLocalizations.of(context)!.enter_password,
              label: AppLocalizations.of(context)!.password,
              onChanged: widget.onPasswordChanged,
              validator: widget.passwordValidator,
            ),
          ),
          horizontalSpace(17.w),
          Expanded(
            child: CustomPasswordTextFormField(
              controller: widget.confirmPasswordController,
              hint: AppLocalizations.of(context)!.confirm_password,
              label: AppLocalizations.of(context)!.confirm_password,
              onChanged: widget.onConfirmPasswordChanged,
              validator: widget.confirmPasswordValidator,
            ),
          ),
        ],
      ),
    );
  }
}
