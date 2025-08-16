import 'package:injectable/injectable.dart';
import 'package:online_exam/core/network/api_services.dart';
import 'package:online_exam/features/main_layout/profile/data/models/Change_password_input_model.dart';
import 'package:online_exam/features/main_layout/profile/data/models/change_password_dto.dart';
import 'package:online_exam/features/main_layout/profile/data/models/edit_profile_dto.dart';
import 'package:online_exam/features/main_layout/profile/data/models/edit_profile_input_model.dart';
import 'package:online_exam/features/main_layout/profile/data/models/get_user_data_dto.dart';
import 'edit_profile_ds.dart';

@Injectable(as: EditProfileDataSource)
class EditProfileDataSourceImpl implements EditProfileDataSource {
  final ApiServices _apiServices;

  EditProfileDataSourceImpl(this._apiServices);

  @override
  Future<GetUserDataDto> getUserData() async {
    return await _apiServices.getUserData();
  }

  @override
  Future<ChangePasswordDto> changePassword(
    ChangePasswordInputModel model,
  ) async {
    return await _apiServices.changePassword(model);
  }

  @override
  Future<EditProfileDto> editProfile(EditProfileInputModel model) async {
    return await _apiServices.editProfile(model);
  }
}
