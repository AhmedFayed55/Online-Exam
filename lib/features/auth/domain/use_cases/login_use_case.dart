import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/failures.dart';
import 'package:online_exam/features/auth/data/models/login/login_request.dart';
import 'package:online_exam/features/auth/domain/entities/login/user_entity.dart';
import 'package:online_exam/features/auth/domain/repositories/auth_repo.dart';

@injectable
class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<Either<Failures, UserEntity>> invoke(LoginRequest loginRequest) =>
      authRepository.signIn(loginRequest);
}
