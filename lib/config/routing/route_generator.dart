import 'package:flutter/material.dart';
import '../../features/auth/presentation/pages/sign_in_screen.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInScreen());

      // case AppRoutes.signUpRoute:
      //   return MaterialPageRoute(builder: (_) => const SignUpScreen());

      // case AppRoutes.forgetPasswordRoute:
      //   return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());

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
