part of 'exam_cubit.dart';

sealed class ExamState {}

final class ExamInitial extends ExamState {}

final class ExamLoading extends ExamState {}

final class ExamSucc extends ExamState {
  final List<QuestionEntity> questions;
  ExamSucc({required this.questions});
}

final class ExamError extends ExamState {
  final String errorMessage;
  final String code;
  ExamError({required this.errorMessage, required this.code});
}
