import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/Exam/data/models/questions/questions_dto.dart';
import 'package:online_exam/features/auth/data/models/login/login_response_dm.dart';
import 'package:online_exam/features/auth/data/models/userInputModels/register_input_model.dart';
import 'package:online_exam/features/auth/data/models/userModel/user_model.dart';
import 'package:online_exam/features/main_layout/explore/data/models/subjects_dto/subjects_dto.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/auth/data/models/login/login_request.dart';
import 'api_constants.dart';

part 'api_services.g.dart';

@RestApi()
@injectable
abstract class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;

  @POST(ApiConstants.signInEndpoint)
  Future<LoginResponseDm> signIn(@Body() LoginRequest request);
  @POST(ApiConstants.signUpEndpoint)
  Future<UserModelDto> signUp(@Body() RegisterInputModel registerInputModel);
  @GET(ApiConstants.getSubjectsEndpoint)
  Future<SubjectsDto> getSubjects(@Header(ApiConstants.token) String token);
  @GET(ApiConstants.getQuestionsEndpoint)
  Future<QuestionsDto> getAllQuestionsOnExam(
    @Header(ApiConstants.token) String token,
    @Path(ApiConstants.examId) String examId,
  );
}
