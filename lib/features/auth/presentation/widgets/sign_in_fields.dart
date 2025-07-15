import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/validators.dart';
import '../../../../core/l10n/translations/app_localizations.dart';
import '../manager/auth_cubit.dart';

class SignInFields extends StatefulWidget {
  const SignInFields({super.key});

  @override
  State<SignInFields> createState() => _SignInFieldsState();
}

class _SignInFieldsState extends State<SignInFields> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        spacing: 24.h,
        children: [
          TextFormField(
            controller: AuthCubit.get(context).email,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.email,
              hintText: AppLocalizations.of(context)!.enter_your_email,
            ),
            validator: Validations.validateEmail,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          TextFormField(
            controller: AuthCubit.get(context).password,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.password,
              hintText: AppLocalizations.of(context)!.enter_your_password,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: const Icon(Icons.visibility_off),
              ),
            ),
            obscureText: isObscure,
            validator: Validations.validatePassword,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
