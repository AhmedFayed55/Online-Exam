import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/failure.dart';
import 'package:online_exam/features/auth/data/dataSouurces/auth_remote_data_srource.dart';
import 'package:online_exam/features/auth/data/models/userInputModels/register_input_model.dart';
import 'package:online_exam/features/auth/data/models/userModel/user_model.dart';
import 'package:online_exam/features/auth/domian/Entity/user_entity.dart';
import 'package:online_exam/features/auth/domian/repo/auth_repo.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> signUp(
    RegisterInputModel registerInputModel,
  ) async {
    try {
      UserModelDto result = await remoteDataSource.signUp(registerInputModel);
      return right(result.user.toEntity());
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(dioException: e));
    } catch (e) {
      return left(ServerFailure(errorMessage: 'Unexpected error occurred.'));
    }
  }
}
