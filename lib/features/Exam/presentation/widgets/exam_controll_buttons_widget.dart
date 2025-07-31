import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/theme/colors.dart';
import 'package:online_exam/core/classes/exam_controllers.dart';
import 'package:online_exam/features/Exam/data/models/answer/answer.dart';
import 'package:online_exam/features/Exam/domain/entities/question_entity.dart';
import 'package:online_exam/features/Exam/presentation/cubit/exam_cubit.dart';

class ExamControllWidget extends StatelessWidget {
  const ExamControllWidget({super.key, required this.questionsList});

  final List<QuestionEntity> questionsList;
  void _saveAnswer(BuildContext context) {
    context.read<ExamCubit>().saveAnswer(
      answerModel: InputAnswers(
        correct: ExamControllers.instance.answerkey.value,
        questionId:
            questionsList[ExamControllers.instance.pageIndex.value].questionId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ExamControllers.instance.questionNumberNotifier,
      child: CustomExamButton(
        text: 'Next',
        onPressed: () {
          ExamControllers.instance.pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          );
          _saveAnswer(context);
        },
        backgroundColor: AppColors.blue,
        borderColor: AppColors.blue,
        textStyle: Theme.of(
          context,
        ).textTheme.labelLarge!.copyWith(color: AppColors.white),
      ),
      builder: (context, value, child) {
        if (value == questionsList.length) {
          return CustomExamButton(
            text: 'Finish',
            onPressed: () {
              _saveAnswer(context);
            },
            borderColor: AppColors.blue,
            backgroundColor: AppColors.blue,
            textStyle: Theme.of(
              context,
            ).textTheme.labelLarge!.copyWith(color: AppColors.white),
          );
        }
        return child!;
      },
    );
  }
}

class CustomExamButton extends StatelessWidget {
  const CustomExamButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.white,
    this.borderColor,
    required this.textStyle,
  });

  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color? borderColor;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: 3,
              style: BorderStyle.solid,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: textStyle),
      ),
    );
  }
}
