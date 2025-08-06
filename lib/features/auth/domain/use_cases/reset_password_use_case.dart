import 'package:injectable/injectable.dart';
import 'package:online_exam/features/auth/domain/repositories/auth_repo.dart';

import '../../../../core/errors/api_results.dart';
import '../../data/models/forget_password/reset_password_input_model.dart';
import '../entities/forget_password/reset_password_response_entity.dart';

@injectable
class ResetPasswordUseCase {
  final AuthRepository _repository;

  ResetPasswordUseCase(this._repository);

  Future<ApiResult<ResetPasswordResponseEntity>> invoke(
    ResetPasswordInputModel resetPasswordInputModel,
  ) {
    return _repository.resetPassword(resetPasswordInputModel);
  }
}
