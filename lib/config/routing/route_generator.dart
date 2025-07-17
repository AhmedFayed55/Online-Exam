import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:online_exam/features/auth/presentation/manager/auth_cubit.dart';
import 'package:online_exam/features/main_layout/main_layout.dart';
import '../../core/di/di.dart';
import '../../features/auth/presentation/pages/sign_in_screen.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signInRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<AuthCubit>(),
            child: const SignInScreen(),
          ),
        );

      case AppRoutes.signUpRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt.get<AuthCubit>(),
            child: const SignUpScreen(),
          ),
        );

      // case AppRoutes.forgetPasswordRoute:
      //   return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());

      case AppRoutes.mainLayout:
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
