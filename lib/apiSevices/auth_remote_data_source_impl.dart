import 'package:injectable/injectable.dart';
import 'package:online_exam/apiSevices/api_service.dart';
import 'package:online_exam/features/auth/data/dataSouurces/auth_remote_data_srource.dart';
import 'package:online_exam/features/auth/data/models/userInputModels/register_input_model.dart';
import 'package:online_exam/features/auth/data/models/userModel/user_model.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;
  AuthRemoteDataSourceImpl({required this.apiService});

  @override
  Future<UserModelDto> signUp(RegisterInputModel registerInputModel) async {
    UserModelDto userModelDto = await apiService.signUp(registerInputModel);
    return userModelDto;
  }
}
