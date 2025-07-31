import 'package:flutter/material.dart';

class ExamControllers {
  ExamControllers._();
  static final ExamControllers instance = ExamControllers._();
  final PageController pageController = PageController();
  final ValueNotifier<String> answerNotifier = ValueNotifier('');
  final ValueNotifier<int> questionNumberNotifier = ValueNotifier(1);
  final ValueNotifier<String> answerkey = ValueNotifier('');
  final ValueNotifier<int> pageIndex = ValueNotifier(0);

  void dispose() {
    pageController.dispose();
    answerNotifier.dispose();
    questionNumberNotifier.dispose();
    pageIndex.dispose();
    answerkey.dispose();
  }
}
