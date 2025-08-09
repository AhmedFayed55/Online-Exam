import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/features/auth/domain/entities/login/user_entity.dart';
import 'package:online_exam/features/main_layout/profile/domain/repositories/edit_profile_repo.dart';

@injectable
class GetUserDataUseCase {
  final EditProfileRepository _repository;

  GetUserDataUseCase(this._repository);

  Future<ApiResult<UserEntity>> invoke() {
    return _repository.getUserData();
  }
}
