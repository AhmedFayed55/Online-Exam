import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/features/auth/domain/entities/login/user_entity.dart';
import 'package:online_exam/features/main_layout/profile/data/models/Change_password_input_model.dart';
import 'package:online_exam/features/main_layout/profile/data/models/edit_profile_input_model.dart';
import 'package:online_exam/features/main_layout/profile/domain/entities/change_password_entity.dart';
import 'package:online_exam/features/main_layout/profile/domain/entities/edit_profile_entity.dart';

abstract interface class EditProfileRepository {
  Future<ApiResult<UserEntity>> getUserData();

  Future<ApiResult<ChangePasswordEntity>> changePassword(
    ChangePasswordInputModel model,
  );

  Future<ApiResult<EditProfileEntity>> editProfile(EditProfileInputModel model);
}
