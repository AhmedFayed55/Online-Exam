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
