import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/theme/colors.dart';
import 'package:online_exam/core/classes/exam_controllers.dart';
import 'package:online_exam/core/helpers/spacing.dart';

class CustomLinerProgressIndicator extends StatelessWidget {
  const CustomLinerProgressIndicator({
    super.key,
    required this.questionsLength,
  });
  final int questionsLength;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: ExamControllers.instance.questionNumberNotifier,
      builder: (context, value, child) => Column(
        children: [
          Text(
            'Questions $value  of $questionsLength',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          verticalSpace(2),
          SizedBox(
            height: 4.h,
            child: LinearProgressIndicator(
              value: value / questionsLength,
              backgroundColor: AppColors.black[10],
              color: AppColors.blue,
              minHeight: 10,
            ),
          ),
        ],
      ),
    );
  }
}
