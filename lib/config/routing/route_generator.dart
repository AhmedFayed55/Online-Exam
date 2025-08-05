import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/features/Exam/presentation/manger/exam_cubit.dart';
import 'package:online_exam/features/Exam/presentation/pages/exam_score_screen.dart';
import 'package:online_exam/features/Exam/presentation/pages/exam_screen_.dart';
import 'package:online_exam/features/main_layout/main_layout.dart';
import 'package:online_exam/features/auth/presentation/manager/signUp/sign_up_cubit.dart';
import 'package:online_exam/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:online_exam/features/auth/presentation/manager/auth_cubit.dart';
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
            create: (context) => getIt.get<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );
      case AppRoutes.examRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt.get<ExamCubit>(),

            child: const ExamScreen(),
          ),
        );
      // case AppRoutes.forgetPasswordRoute:
      //   return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case AppRoutes.mainLayoutRoute:
        return MaterialPageRoute(builder: (context) => const MainLayout());
      case AppRoutes.examScoreRoute:
        final examCubit = settings.arguments as ExamCubit;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: examCubit,
            child: const ExammScoreScreen(),
          ),
        );

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
