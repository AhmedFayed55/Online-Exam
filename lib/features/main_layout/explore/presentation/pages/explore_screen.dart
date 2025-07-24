import 'package:flutter/material.dart';
import 'package:online_exam/config/theme/colors.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';
import 'package:online_exam/features/main_layout/explore/presentation/widgets/explore_screen_body.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ExploreScreenBody(),
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.survey,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(color: AppColors.blue),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
