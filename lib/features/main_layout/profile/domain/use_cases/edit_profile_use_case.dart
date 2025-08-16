import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/features/main_layout/profile/data/models/edit_profile_input_model.dart';
import 'package:online_exam/features/main_layout/profile/domain/entities/edit_profile_entity.dart';
import 'package:online_exam/features/main_layout/profile/domain/repositories/edit_profile_repo.dart';

@injectable
class EditProfileUseCase {
  final EditProfileRepository _repository;

  EditProfileUseCase(this._repository);

  Future<ApiResult<EditProfileEntity>> invoke(EditProfileInputModel model) =>
      _repository.editProfile(model);
}
