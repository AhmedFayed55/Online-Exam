import 'package:online_exam/features/main_layout/profile/data/models/Change_password_input_model.dart';
import 'package:online_exam/features/main_layout/profile/data/models/change_password_dto.dart';
import 'package:online_exam/features/main_layout/profile/data/models/edit_profile_dto.dart';
import 'package:online_exam/features/main_layout/profile/data/models/edit_profile_input_model.dart';
import 'package:online_exam/features/main_layout/profile/data/models/get_user_data_dto.dart';

abstract interface class EditProfileDataSource {
  Future<GetUserDataDto> getUserData();

  Future<ChangePasswordDto> changePassword(ChangePasswordInputModel model);

  Future<EditProfileDto> editProfile(EditProfileInputModel model);
}
