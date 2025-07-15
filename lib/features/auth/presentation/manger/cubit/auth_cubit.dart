import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/features/auth/data/models/userInputModels/register_input_model.dart';
import 'package:online_exam/features/auth/domian/Entity/user_entity.dart';
import 'package:online_exam/features/auth/domian/useCases/sign_up_usecase.dart';
part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final SignUpUseCase signUpUseCase;
  AuthCubit(this.signUpUseCase) : super(AuthInitial());

  void signUp(RegisterInputModel registerInputModel) async {
    emit(AuthLoading());
    final result = await signUpUseCase.call(registerInputModel);
    result.fold(
      (failure) =>
          emit(AuthError(message: failure.errorMessage, code: failure.code)),
      (userEntity) => emit(AuthSuccess(userEntity: userEntity)),
    );
  }
}
