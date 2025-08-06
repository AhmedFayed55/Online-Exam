import 'package:injectable/injectable.dart';

import '../../../../core/errors/api_results.dart';
import '../../data/models/forget_password/email_verification_input_model.dart';
import '../entities/forget_password/verify_reset_code_response_entity.dart';
import '../repositories/auth_repo.dart';

@injectable
class ConfirmCodeUseCase {
  final AuthRepository _authRepository;

  ConfirmCodeUseCase(this._authRepository);

  Future<ApiResult<VerifyResetCodeResponseEntity>> invoke(
    EmailVerificationInputModel resetCode,
  ) {
    return _authRepository.confirmCode(resetCode);
  }
}
