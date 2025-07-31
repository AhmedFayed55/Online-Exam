import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:online_exam/config/theme/colors.dart';

class CustomTimerWidget extends StatelessWidget {
  const CustomTimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // SvgPicture.asset('assets/images/alarm.svg', height: 34.h, width: 24.w),
        TimerCountdown(
          enableDescriptions: false,
          spacerWidth: 0,
          timeTextStyle: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(color: AppColors.green),
          format: CountDownTimerFormat.minutesSeconds,
          endTime: DateTime.now().add(const Duration(minutes: 30)),
          onEnd: () {
            print("Timer finished");
          },
        ),
      ],
    );
  }
}
