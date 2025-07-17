import 'package:dartz/dartz.dart';
import 'package:online_exam/core/errors/failures.dart';
import 'package:online_exam/features/auth/data/models/login/login_request.dart';
import 'package:online_exam/features/auth/data/models/login/login_response_dm.dart';
import 'package:online_exam/features/auth/data/models/userInputModels/register_input_model.dart';
import 'package:online_exam/features/auth/data/models/userModel/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures, LoginResponseDm>> signIn(LoginRequest loginRequest);
  Future<UserModelDto> signUp(RegisterInputModel registerInputModel);
}
