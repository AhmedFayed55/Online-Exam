import 'package:dartz/dartz.dart';
import 'package:online_exam/core/errors/failure.dart';
import 'package:online_exam/features/auth/data/models/userInputModels/register_input_model.dart';
import 'package:online_exam/features/auth/domian/Entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signUp(
    RegisterInputModel registerInputModel,
  );
}
