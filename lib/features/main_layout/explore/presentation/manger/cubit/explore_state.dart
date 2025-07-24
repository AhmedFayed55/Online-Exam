part of 'explore_cubit.dart';

@immutable
sealed class ExploreState {}

class ExploreInitial extends ExploreState {}

class ExploreLoadingState extends ExploreState {}

class ExploreSuccessState extends ExploreState {
  final List<SubjectEntity> subjects;
  ExploreSuccessState({required this.subjects});
}

class ExploreErrorState extends ExploreState {
  final String errorMessage;
  final String code;
  ExploreErrorState({required this.errorMessage, required this.code});
}
