import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/failure.dart';
import 'package:online_exam/core/errors/failures.dart';
import 'package:online_exam/features/auth/data/data_sources/auth_remote_ds.dart';
import 'package:online_exam/features/auth/data/models/login/login_request.dart';
import 'package:online_exam/features/auth/data/models/userInputModels/register_input_model.dart';
import 'package:online_exam/features/auth/data/models/userModel/user_model.dart';
import 'package:online_exam/features/auth/domain/entities/login/user_entity.dart';
import 'package:online_exam/features/auth/domain/repositories/auth_repo.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failures, UserEntity>> signIn(LoginRequest loginRequest) async {
    var response = await dataSource.signIn(loginRequest);
    return response.fold(
      (error) => Left(error),
      (response) => Right(response.user!.toEntity()),
    );
  }

  @override
  Future<Either<Failure, UserEntity>> signUp(
    RegisterInputModel registerInputModel,
  ) async {
    try {
      UserModelDto result = await dataSource.signUp(registerInputModel);
      return right(result.user.toEntity());
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(dioException: e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
