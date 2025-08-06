import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/theme/colors.dart';

import '../../../../core/utils/font_weight.dart';

class OtpTextFieldWidget extends StatelessWidget {
  const OtpTextFieldWidget({
    super.key,
    required this.onSubmit,
    required this.invalidCode,
  });

  final void Function(String) onSubmit;
  final bool invalidCode;

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 6,
      borderColor: !invalidCode ? Colors.transparent : Colors.red,
      focusedBorderColor: !invalidCode ? Colors.transparent : Colors.red,
      enabledBorderColor: !invalidCode ? Colors.transparent : Colors.red,
      disabledBorderColor: !invalidCode ? Colors.transparent : Colors.red,
      filled: true,
      fillColor: AppColors.otpFieldBorderColor,
      borderRadius: BorderRadius.circular(8),
      fieldWidth: 45.w,
      fieldHeight: 60.h,
      decoration: InputDecoration(
        labelStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: AppFontWeight.medium,
          color: AppColors.grey,
        ),
      ),
      keyboardType: TextInputType.number,
      showFieldAsBox: true,
      onSubmit: onSubmit,
    );
  }
}
