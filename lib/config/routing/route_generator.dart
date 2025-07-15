import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/features/auth/presentation/manager/auth_cubit.dart';
import 'package:online_exam/features/main_layout/main_layout.dart';
import '../../core/di/di.dart';
import 'package:online_exam/features/forget_password/presentation/screens/reset_password_screen.dart';
import '../../features/auth/presentation/pages/sign_in_screen.dart';
import '../../features/forget_password/presentation/screens/forget_password_screen.dart';
import '../../features/forget_password/presentation/screens/verification_screen.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      // case AppRoutes.signInRoute:
      //   return MaterialPageRoute(builder: (_) =>
      //       BlocProvider(
      //           create: (_) => getIt<AuthCubit>(),
      //           child: const SignInScreen()));

      // case AppRoutes.signUpRoute:
      //   return MaterialPageRoute(builder: (_) => const SignUpScreen());

       case AppRoutes.forgetPasswordRoute:
         return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
       case AppRoutes.verificationRoute:
         return MaterialPageRoute(builder: (_) => const VerificationScreen());
       case AppRoutes.resetPasswordRoute:
         return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());

      case AppRoutes.mainLayout :
        return MaterialPageRoute(builder: (context) => const MainLayout());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No Route Found')),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
