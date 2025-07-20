import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/features/auth/data/models/userInputModels/register_input_model.dart';
import 'package:online_exam/features/auth/domain/entities/login/user_entity.dart';
import 'package:online_exam/features/auth/domain/use_cases/sign_up_usecase.dart';
part 'sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase signUpUseCase;
  SignUpCubit(this.signUpUseCase) : super(SignUpInitial());

  void signUp(RegisterInputModel registerInputModel) async {
    emit(SignUpLoadingState());
    final result = await signUpUseCase.call(registerInputModel);
    switch (result) {
      case ApiSuccessResult<UserEntity>():
        emit(SignUpSuccessState(userEntity: result.data));

      case ApiErrorResult<UserEntity>():
        emit(
          SignUpErrorState(
            errorMessage: result.failure.errorMessage,
            code: result.failure.code,
          ),
        );
    }
  }
}
