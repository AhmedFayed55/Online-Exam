import '../../domain/entities/exams_on_subject_entity.dart';

abstract class GetExamsState {}

class GetExamsInitialState extends GetExamsState {}

class GetExamsLoadingState extends GetExamsState {}

class GetExamsSuccessState extends GetExamsState {
  final List<ExamsEntity> exams;

  GetExamsSuccessState({required this.exams});
}

class GetExamsErrorState extends GetExamsState {
  final String errorMessage;

  GetExamsErrorState({required this.errorMessage});
}
