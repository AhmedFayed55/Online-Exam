import 'package:dartz/dartz.dart';
import 'package:online_exam/features/auth/domain/entities/login/user_entity.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/login/login_request.dart';

abstract class AuthRepository {
  Future<Either<Failures, UserEntity>> signIn(LoginRequest loginRequest);
}
