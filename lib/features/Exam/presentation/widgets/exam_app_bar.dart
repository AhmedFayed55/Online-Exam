import 'package:flutter/material.dart';
import 'package:online_exam/features/Exam/presentation/widgets/custom_timer_widget.dart';
import 'package:online_exam/features/auth/presentation/widgets/custom_app_bar.dart';

class ExamAppBar extends StatelessWidget {
  const ExamAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBackButton(title: 'Examss'),
        CustomTimerWidget(),
      ],
    );
  }
}
