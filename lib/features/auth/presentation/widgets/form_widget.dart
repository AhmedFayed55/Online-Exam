import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/enums/auth_enum.dart';
import 'package:online_exam/core/functions/auth_validator.dart';
import 'package:online_exam/core/helpers/spacing.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';
import 'package:online_exam/features/auth/presentation/widgets/password_row_fields.dart';
import 'package:online_exam/features/auth/presentation/widgets/row_text_field_widget.dart';
import 'package:online_exam/features/auth/presentation/widgets/sign_up_bloc_consumer.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});
  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  late TextEditingController userNameController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController phoneNumberController;
  late GlobalKey<FormState> formKey;
  bool isvalidated = false;
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  void initcontrollers() {
    userNameController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneNumberController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void disposeControllers() {
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    formKey.currentState?.dispose();
  }

  void updateButtonState(String _) {
    final isValid = formKey.currentState?.validate() ?? false;
    setState(() {
      isvalidated = isValid;
    });
  }

  @override
  void initState() {
    initcontrollers();
    super.initState();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUnfocus,
      child: Column(
        children: [
          TextFormField(
            onChanged: updateButtonState,
            validator: (value) =>
                authValidator(value: value!, filedType: FiledType.userName),
            controller: userNameController,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.enter_your_user_name,
              labelText: AppLocalizations.of(context)!.user_name,
            ),
          ),
          verticalSpace(24.h),
          RowTextField(
            onChanged1: updateButtonState,
            onChanged2: updateButtonState,
            validator1: (value) =>
                authValidator(value: value!, filedType: FiledType.firstName),
            validator2: (value) =>
                authValidator(value: value!, filedType: FiledType.lastName),
            controller1: firstNameController,
            controller2: lastNameController,
          ),
          verticalSpace(24.h),
          TextFormField(
            onChanged: updateButtonState,
            validator: (value) =>
                authValidator(value: value!, filedType: FiledType.email),
            controller: emailController,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.enter_your_email,
              labelText: AppLocalizations.of(context)!.email,
            ),
          ),
          verticalSpace(24.h),
          PasswordRowFields(
            onPasswordChanged: updateButtonState,
            onConfirmPasswordChanged: updateButtonState,
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
            passwordValidator: (value) =>
                authValidator(value: value!, filedType: FiledType.password),
            confirmPasswordValidator: (value) => authValidator(
              value: value!,
              filedType: FiledType.confrimPassword,
              confrimPassword: passwordController.text,
            ),
          ),
          verticalSpace(24.h),
          TextFormField(
            onChanged: updateButtonState,
            validator: (value) =>
                authValidator(value: value!, filedType: FiledType.phoneNumber),
            controller: phoneNumberController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.enter_phone_number,
              labelText: AppLocalizations.of(context)!.phone_number,
            ),
          ),
          verticalSpace(48.h),
          SignUpButtonBlockCosumer(
            isvalidated: isvalidated,
            confirmPasswordController: confirmPasswordController,
            emailController: emailController,
            firstNameController: firstNameController,
            lastNameController: lastNameController,
            passwordController: passwordController,
            phoneNumberController: phoneNumberController,
            userNameController: userNameController,
          ),
        ],
      ),
    );
  }
}
