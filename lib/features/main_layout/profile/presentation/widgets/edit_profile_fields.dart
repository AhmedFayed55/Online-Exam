import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/routing/routing_extensions.dart';
import 'package:online_exam/config/theme/colors.dart';
import 'package:online_exam/core/helpers/validators.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';
import 'package:online_exam/core/utils/font_weight.dart';

import '../../../../../config/routing/app_routes.dart';

class EditProfileFields extends StatelessWidget {
  const EditProfileFields({
    super.key,
    required this.userNameController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.phoneNumberController,
    required this.passwordController,
    required this.formKey,
  });

  final TextEditingController userNameController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24.h,
      children: [
        CustomTextFormField(
          controller: userNameController,
          labelText: AppLocalizations.of(context)!.user_name,
        ),
        Row(
          spacing: 17.w,
          children: [
            Expanded(
              child: CustomTextFormField(
                controller: firstNameController,
                labelText: AppLocalizations.of(context)!.first_name,
              ),
            ),
            Expanded(
              child: CustomTextFormField(
                controller: lastNameController,
                labelText: AppLocalizations.of(context)!.last_name,
              ),
            ),
          ],
        ),
        CustomTextFormField(
          validator: Validations.validateEmail,
          controller: emailController,
          labelText: AppLocalizations.of(context)!.email,
          keyboardType: TextInputType.emailAddress,
        ),
        CustomTextFormField(
          suffix: InkWell(
            onTap: () => context.pushNamed(AppRoutes.changePassword),
            child: Text(
              AppLocalizations.of(context)!.change,
              style: TextStyle(
                color: AppColors.blue[0],
                fontSize: 12.sp,
                fontWeight: AppFontWeight.semiBold,
              ),
            ),
          ),
          controller: passwordController,
          labelText: AppLocalizations.of(context)!.password,
          isObscure: true,
          isReadOnly: true,
        ),
        CustomTextFormField(
          validator: Validations.validatePhoneNumber,
          controller: phoneNumberController,
          labelText: AppLocalizations.of(context)!.phone_number,
          keyboardType: TextInputType.phone,
        ),
      ],
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.isObscure,
    this.isReadOnly,
    this.keyboardType,
    this.validator,
    this.controller,
    this.hintText,
    this.suffix,
  });

  final String labelText;
  final String? hintText;
  final bool? isReadOnly;
  final bool? isObscure;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        suffix: suffix,
        labelText: labelText,
        hintText: hintText ?? "",
      ),
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: isObscure ?? false,
      readOnly: isReadOnly ?? false,
    );
  }
}
