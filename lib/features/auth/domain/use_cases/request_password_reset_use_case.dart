import 'package:injectable/injectable.dart';
import 'package:online_exam/features/auth/data/models/forget_password/forget_password_input_model.dart';

import '../../../../core/errors/api_results.dart';
import '../entities/forget_password/forget_password_response_entity.dart';
import '../repositories/auth_repo.dart';

@injectable
class RequestPasswordResetUseCase {
  final AuthRepository _authRepository;

  RequestPasswordResetUseCase(this._authRepository);

  Future<ApiResult<ForgetPasswordResponseEntity>> invoke(
    ForgetPasswordInputModel email,
  ) {
    return _authRepository.requestPasswordReset(email);
  }
}
