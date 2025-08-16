import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/features/main_layout/profile/data/models/Change_password_input_model.dart';
import 'package:online_exam/features/main_layout/profile/domain/entities/change_password_entity.dart';
import 'package:online_exam/features/main_layout/profile/domain/repositories/edit_profile_repo.dart';

@injectable
class ChangePasswordUseCase {
  final EditProfileRepository _repository;

  ChangePasswordUseCase(this._repository);

  Future<ApiResult<ChangePasswordEntity>> invoke(
    ChangePasswordInputModel model,
  ) {
    return _repository.changePassword(model);
  }
}
