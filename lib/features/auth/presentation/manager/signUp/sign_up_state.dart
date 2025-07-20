part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoadingState extends SignUpState {}

final class SignUpErrorState extends SignUpState {
  final String errorMessage;
  final String code;
  SignUpErrorState({required this.errorMessage, required this.code});
}

final class SignUpSuccessState extends SignUpState {
  final UserEntity userEntity;
  SignUpSuccessState({required this.userEntity});
}
