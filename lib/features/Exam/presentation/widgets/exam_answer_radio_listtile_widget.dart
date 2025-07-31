import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/theme/colors.dart';
import 'package:online_exam/core/classes/exam_controllers.dart';
import 'package:online_exam/features/Exam/data/models/questions/answer.dart';
import 'package:online_exam/features/Exam/domain/entities/question_entity.dart';

class ExamAnswerRadioListTileWidget extends StatelessWidget {
  const ExamAnswerRadioListTileWidget({
    super.key,
    required this.questionEntity,
    required this.answers,
  });
  final QuestionEntity questionEntity;
  final Answer answers;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: ExamControllers.instance.answerNotifier,
      builder: (context, groubValue, child) {
        return Container(
          decoration: BoxDecoration(
            color: groubValue == answers.answer
                ? AppColors.blue[10]
                : AppColors.lightBlue,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: RadioListTile(
            radioScaleFactor: 1.2,
            activeColor: AppColors.blue,
            value: answers.answer,
            groupValue: groubValue,
            onChanged: (value) {
              ExamControllers.instance.answerNotifier.value = value!;
              ExamControllers.instance.answerkey.value = answers.key!;
            },
            title: Text(answers.answer!),
          ),
        );
      },
    );
  }
}
