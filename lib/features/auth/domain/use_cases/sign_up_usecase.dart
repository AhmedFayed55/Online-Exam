import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/failure.dart';
import 'package:online_exam/features/auth/data/models/userInputModels/register_input_model.dart';
import 'package:online_exam/features/auth/domain/entities/login/user_entity.dart';
import 'package:online_exam/features/auth/domain/repositories/auth_repo.dart';

@injectable
class SignUpUseCase {
  final AuthRepository _authRepo;
  SignUpUseCase(this._authRepo);
  Future<Either<Failure, UserEntity>> call(
    RegisterInputModel registerInputModel,
  ) async => await _authRepo.signUp(registerInputModel);
}
