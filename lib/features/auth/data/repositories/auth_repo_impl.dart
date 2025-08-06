import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/core/errors/failure.dart';
import 'package:online_exam/core/errors/failures.dart';
import 'package:online_exam/features/auth/data/data_sources/auth_remote_ds.dart';
import 'package:online_exam/features/auth/data/models/forget_password/forget_password_input_model.dart';
import 'package:online_exam/features/auth/data/models/login/login_request.dart';
import 'package:online_exam/features/auth/data/models/userInputModels/register_input_model.dart';
import 'package:online_exam/features/auth/data/models/userModel/user_model.dart';
import 'package:online_exam/features/auth/domain/entities/login/user_entity.dart';
import 'package:online_exam/features/auth/domain/repositories/auth_repo.dart';

import '../../domain/entities/forget_password/forget_password_response_entity.dart';
import '../../domain/entities/forget_password/reset_password_response_entity.dart';
import '../../domain/entities/forget_password/verify_reset_code_response_entity.dart';
import '../models/forget_password/email_verification_input_model.dart';
import '../models/forget_password/forget_password_response_dto.dart';
import '../models/forget_password/reset_password_input_model.dart';
import '../models/forget_password/reset_password_response_dto.dart';
import '../models/forget_password/verify_reset_code_response_dto.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failures, UserEntity>> signIn(LoginRequest loginRequest) async {
    var response = await _dataSource.signIn(loginRequest);
    return response.fold(
      (error) => Left(error),
      (response) => Right(response.toEntity()),
    );
  }

  @override
  Future<ApiResult<UserEntity>> signUp(
    RegisterInputModel registerInputModel,
  ) async {
    try {
      UserModelDto result = await _dataSource.signUp(registerInputModel);
      return ApiSuccessResult<UserEntity>(data: result.user.toEntity());
    } on DioException catch (e) {
      return ApiErrorResult<UserEntity>(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult<UserEntity>(
        failure: Failure(errorMessage: e.toString()),
      );
    }
  }

  @override
  Future<ApiResult<VerifyResetCodeResponseEntity>> confirmCode(
      EmailVerificationInputModel resetCode,) async {
    try {
      VerifyResetCodeResponseDto result =
      await _dataSource.confirmCode(resetCode);
      return ApiSuccessResult<VerifyResetCodeResponseEntity>(
        data: result.toEntity(),
      );
    } on DioException catch (e) {
      return ApiErrorResult<VerifyResetCodeResponseEntity>(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult<VerifyResetCodeResponseEntity>(
        failure: Failure(errorMessage: e.toString()),
      );
    }
  }

  @override
  Future<ApiResult<ForgetPasswordResponseEntity>> requestPasswordReset(
      ForgetPasswordInputModel email,) async {
    try {
      ForgetPasswordResponseDto result = await _dataSource.requestPasswordReset(
          email);
      return ApiSuccessResult<ForgetPasswordResponseEntity>(
        data: result.toEntity(),
      );
    } on DioException catch (e) {
      return ApiErrorResult<ForgetPasswordResponseEntity>(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult<ForgetPasswordResponseEntity>(
        failure: Failure(errorMessage: e.toString()),
      );
    }
  }

  @override
  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword(
      ResetPasswordInputModel resetPasswordInputModel,) async {
    try {
      ResetPasswordResponseDto result =
      await _dataSource.resetPassword(resetPasswordInputModel);
      return ApiSuccessResult<ResetPasswordResponseEntity>(
        data: result.toEntity(),
      );
    } on DioException catch (e) {
      return ApiErrorResult<ResetPasswordResponseEntity>(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult<ResetPasswordResponseEntity>(
        failure: Failure(errorMessage: e.toString()),
      );
    }
  }
}
