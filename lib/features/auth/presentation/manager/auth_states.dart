import 'package:online_exam/core/errors/failures.dart';
import 'package:online_exam/features/auth/domain/entities/login/user_entity.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {
  UserEntity userEntity;

  LoginSuccessState(this.userEntity);
}

class LoginErrorState extends AuthStates {
  Failures error;

  LoginErrorState(this.error);
}

class AuthLoading extends AuthStates {}

class AuthError extends AuthStates {
  final String message;
  final String code;
  AuthError({required this.message, required this.code});
}

class AuthSuccess extends AuthStates {
  final UserEntity userEntity;
  AuthSuccess({required this.userEntity});
}
