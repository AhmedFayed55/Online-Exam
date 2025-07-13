import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/auth/data/models/userInputModels/register_input_model.dart';
import 'package:online_exam/features/auth/data/models/userModel/user_model.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@injectable
@RestApi()
abstract class ApiService {
  @factoryMethod
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @POST('auth/signup')
  Future<UserModelDto> signUp(@Body() RegisterInputModel registerInputModel);
}
