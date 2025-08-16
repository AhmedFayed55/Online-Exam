import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/features/auth/presentation/widgets/otp_text_field_widget.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/l10n/translations/app_localizations.dart';

class EmailVerificationWidget extends StatelessWidget {
  const EmailVerificationWidget({
    super.key,
    required this.onSubmit,
    required this.invalidCode,
    required this.resend,
  });

  final void Function(String) onSubmit;
  final bool invalidCode;
  final void Function() resend;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.email_verification,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(fontSize: 18.sp),
        ),
        verticalSpace(16),
        Text(
          AppLocalizations.of(context)!.enter_verification_code,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        verticalSpace(32),
        Column(
          spacing: 5.h,
          children: [
            OtpTextFieldWidget(onSubmit: onSubmit, invalidCode: invalidCode),
            invalidCode
                ? Row(
                    spacing: 5.w,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.error_outline, color: Colors.red, size: 17.sp),
                      Text(AppLocalizations.of(context)!.invalid_code),
                    ],
                  )
                : const SizedBox.shrink(),
          ],
        ),
        verticalSpace(32),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: AppLocalizations.of(context)!.didnt_receive_code,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextSpan(
                text: AppLocalizations.of(context)!.resend,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  decoration: TextDecoration.underline,
                  color: Theme.of(context).colorScheme.primary,
                ),
                recognizer: TapGestureRecognizer()..onTap = resend,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
