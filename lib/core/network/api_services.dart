import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/app_constants.dart';
import 'package:online_exam/features/auth/data/models/login/login_response_dm.dart';
import 'package:online_exam/features/auth/data/models/userInputModels/register_input_model.dart';
import 'package:online_exam/features/auth/data/models/userModel/user_model.dart';
import 'package:online_exam/features/main_layout/explore/data/models/subjects_dto/subjects_dto.dart';
import 'package:online_exam/features/main_layout/profile/data/models/change_password_dto.dart';
import 'package:online_exam/features/main_layout/profile/data/models/edit_profile_dto.dart';
import 'package:online_exam/features/main_layout/profile/data/models/edit_profile_input_model.dart';
import 'package:online_exam/features/main_layout/profile/data/models/get_user_data_dto.dart';
import 'package:online_exam/features/subject_exams/data/model/get_exams_on_subject_dto.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/auth/data/models/login/login_request.dart';
import '../../features/main_layout/profile/data/models/Change_password_input_model.dart';
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

  @GET(ApiConstants.getAllSubjectsExamsOnSubjectEndpoint)
  Future<GetExamsOnSubjectDto> getExamsOnSubject(
      @Header(AppConstants.token) String token,
      @Query(AppConstants.subject) String subjectId,);

  @GET(ApiConstants.getUserData)
  Future<GetUserDataDto> getUserData();

  @PATCH(ApiConstants.changePassword)
  Future<ChangePasswordDto> changePassword(
      @Body() ChangePasswordInputModel model,);

  @PUT(ApiConstants.editProfile)
  Future<EditProfileDto> editProfile(@Body() EditProfileInputModel model,);
}
