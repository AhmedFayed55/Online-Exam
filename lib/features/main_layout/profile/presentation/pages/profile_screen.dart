import 'package:flutter/material.dart';
import 'package:online_exam/config/routing/app_routes.dart';
import 'package:online_exam/config/routing/routing_extensions.dart';
import 'package:online_exam/core/helpers/shared_pref.dart';
import 'package:online_exam/core/utils/app_constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          context.pushNamedAndRemoveUntil(
            AppRoutes.signInRoute,
            predicate: (_) => false,
          );
          SharedPrefHelper.removeData(key: AppConstants.isRemember);
        },
        child: const Text("Logout"),
      ),
    );
  }
}
