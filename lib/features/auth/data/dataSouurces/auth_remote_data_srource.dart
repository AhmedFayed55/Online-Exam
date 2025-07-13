import 'package:online_exam/features/auth/data/models/userInputModels/register_input_model.dart';
import 'package:online_exam/features/auth/data/models/userModel/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModelDto> signUp(RegisterInputModel registerInputModel);
}
