import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/routing/app_routes.dart';
import 'package:online_exam/config/routing/routing_extensions.dart';
import 'package:online_exam/core/helpers/dialogue_utils.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';
import 'package:online_exam/features/auth/data/models/userInputModels/register_input_model.dart';
import 'package:online_exam/features/auth/presentation/manager/auth_cubit.dart';
import 'package:online_exam/features/auth/presentation/manager/auth_states.dart';

class SignUpButtonBlockCosumer extends StatelessWidget {
  const SignUpButtonBlockCosumer({
    super.key,
    required this.isvalidated,
    required this.userNameController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.phoneNumberController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final bool isvalidated;
  final TextEditingController userNameController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthError) {
          DialogueUtils.showMessage(
            context: context,
            message: state.message,
            posActionName: AppLocalizations.of(context)!.ok,
            posAction: () => context.pop,
          );
        }
        if (state is AuthSuccess) {
          DialogueUtils.showMessage(
            title: AppLocalizations.of(context)!.success,
            context: context,
            message: AppLocalizations.of(context)!.acount_created_successfully,
            posActionName: AppLocalizations.of(context)!.ok,
            posAction: () {
              context.pop;
              context.pushNamed(AppRoutes.signInRoute);
            },
          );
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: 48.sp,
          width: state is AuthLoading ? 60.sp : double.infinity,
          child: ElevatedButton(
            style: const ButtonStyle(),
            onPressed: isvalidated
                ? () {
                    context.read<AuthCubit>().signUp(
                      RegisterInputModel(
                        userName: userNameController.text,
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        email: emailController.text,
                        phoneNumber: phoneNumberController.text,
                        password: passwordController.text,
                        rePassword: confirmPasswordController.text,
                      ),
                    );
                  }
                : null,
            child: state is AuthLoading
                ? SizedBox(
                    height: 20.sp,
                    width: 20.sp,
                    child: const CircularProgressIndicator(),
                  )
                : Text(AppLocalizations.of(context)!.sign_up_button),
          ),
        );
      },
    );
  }
}
