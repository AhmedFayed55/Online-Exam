import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:online_exam/core/classes/exam_controllers.dart';
import 'package:online_exam/features/Exam/domain/entities/question_entity.dart';
import 'package:online_exam/features/Exam/presentation/widgets/exam_widget.dart';

class ExamPageView extends StatelessWidget {
  const ExamPageView({super.key, required this.listOfQuestions});
  final List<QuestionEntity> listOfQuestions;
  @override
  Widget build(BuildContext context) {
    return ExpandablePageView.builder(
      onPageChanged: (value) {
        ExamControllers.instance.answerNotifier.value = '';
        ExamControllers.instance.questionNumberNotifier.value = value + 1;
        ExamControllers.instance.answerkey.value = '';
        ExamControllers.instance.pageIndex.value = value;
      },
      itemCount: listOfQuestions.length,
      controller: ExamControllers.instance.pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => ExamWidget(
        questionEntity: listOfQuestions[index],
        questionsLength: listOfQuestions.length,
      ),
    );
  }
}
