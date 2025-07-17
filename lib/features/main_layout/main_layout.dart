import 'package:flutter/material.dart';
import 'package:online_exam/config/routing/app_routes.dart';
import 'package:online_exam/config/routing/routing_extensions.dart';
import 'package:online_exam/core/helpers/shared_pref.dart';
import 'package:online_exam/core/utils/app_constants.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          SharedPrefHelper.removeData(key: AppConstants.userId);
          context.pushNamedAndRemoveUntil(
            AppRoutes.signInRoute,
            predicate: (route) => true,
          );
        },
        child: const Text("Delete Account"),
      ),
    );
  }
}
