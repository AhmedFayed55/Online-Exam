import 'package:dartz/dartz.dart';
import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/features/auth/data/models/forget_password/forget_password_input_model.dart';
import 'package:online_exam/features/auth/data/models/userInputModels/register_input_model.dart';
import 'package:online_exam/features/auth/domain/entities/login/user_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/forget_password/email_verification_input_model.dart';
import '../../data/models/forget_password/reset_password_input_model.dart';
import '../../data/models/login/login_request.dart';
import '../entities/forget_password/forget_password_response_entity.dart';
import '../entities/forget_password/reset_password_response_entity.dart';
import '../entities/forget_password/verify_reset_code_response_entity.dart';

abstract interface class AuthRepository {
  Future<Either<Failures, UserEntity>> signIn(LoginRequest loginRequest);
  Future<ApiResult<UserEntity>> signUp(RegisterInputModel registerInputModel);

  Future<ApiResult<ForgetPasswordResponseEntity>> requestPasswordReset(
      ForgetPasswordInputModel email);

  Future<ApiResult<VerifyResetCodeResponseEntity>> confirmCode(
      EmailVerificationInputModel resetCode);

  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword(
      ResetPasswordInputModel resetPasswordInputModel);
}
