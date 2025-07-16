import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/failure.dart';
import 'package:online_exam/features/auth/data/models/userInputModels/register_input_model.dart';
import 'package:online_exam/features/auth/domian/Entity/user_entity.dart';
import 'package:online_exam/features/auth/domian/repo/auth_repo.dart';

@injectable
class SignUpUseCase {
  final AuthRepo _authRepo;
  SignUpUseCase(this._authRepo);
  Future<Either<Failure, UserEntity>> call(
    RegisterInputModel registerInputModel,
  ) async => await _authRepo.signUp(registerInputModel);
}
