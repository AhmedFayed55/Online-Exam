import 'package:dartz/dartz.dart';
import 'package:online_exam/core/errors/failures.dart';
import 'package:online_exam/features/auth/data/models/forget_password/forget_password_input_model.dart';
import 'package:online_exam/features/auth/data/models/login/login_request.dart';
import 'package:online_exam/features/auth/data/models/login/login_response_dm.dart';
import 'package:online_exam/features/auth/data/models/userInputModels/register_input_model.dart';
import 'package:online_exam/features/auth/data/models/userModel/user_model.dart';

import '../models/forget_password/email_verification_input_model.dart';
import '../models/forget_password/forget_password_response_dto.dart';
import '../models/forget_password/reset_password_input_model.dart';
import '../models/forget_password/reset_password_response_dto.dart';
import '../models/forget_password/verify_reset_code_response_dto.dart';

abstract interface class AuthRemoteDataSource {
  Future<Either<Failures, LoginResponseDm>> signIn(LoginRequest loginRequest);
  Future<UserModelDto> signUp(RegisterInputModel registerInputModel);

  Future<ForgetPasswordResponseDto> requestPasswordReset(
      ForgetPasswordInputModel email);

  Future<VerifyResetCodeResponseDto> confirmCode(
      EmailVerificationInputModel resetCode);

  Future<ResetPasswordResponseDto> resetPassword(
      ResetPasswordInputModel resetPasswordInputModel);
}
