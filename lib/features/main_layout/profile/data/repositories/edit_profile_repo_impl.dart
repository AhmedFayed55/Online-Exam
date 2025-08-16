import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/features/auth/domain/entities/login/user_entity.dart';
import 'package:online_exam/features/main_layout/profile/data/models/Change_password_input_model.dart';
import 'package:online_exam/features/main_layout/profile/data/models/change_password_dto.dart';
import 'package:online_exam/features/main_layout/profile/data/models/edit_profile_dto.dart';
import 'package:online_exam/features/main_layout/profile/data/models/edit_profile_input_model.dart';
import 'package:online_exam/features/main_layout/profile/data/models/get_user_data_dto.dart';
import 'package:online_exam/features/main_layout/profile/domain/entities/change_password_entity.dart';
import 'package:online_exam/features/main_layout/profile/domain/entities/edit_profile_entity.dart';
import 'package:online_exam/features/main_layout/profile/domain/repositories/edit_profile_repo.dart';
import '../../../../../core/errors/failure.dart';
import '../data_sources/edit_profile_ds.dart';

@Injectable(as: EditProfileRepository)
class EditProfileRepositoryImpl implements EditProfileRepository {
  final EditProfileDataSource _dataSource;

  EditProfileRepositoryImpl(this._dataSource);

  @override
  Future<ApiResult<UserEntity>> getUserData() async {
    try {
      GetUserDataDto result = await _dataSource.getUserData();
      return ApiSuccessResult<UserEntity>(data: result.user!.toEntity());
    } on DioException catch (e) {
      return ApiErrorResult<UserEntity>(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult<UserEntity>(
        failure: Failure(errorMessage: e.toString()),
      );
    }
  }

  @override
  Future<ApiResult<ChangePasswordEntity>> changePassword(
    ChangePasswordInputModel model,
  ) async {
    try {
      ChangePasswordDto result = await _dataSource.changePassword(model);
      return ApiSuccessResult<ChangePasswordEntity>(data: result.toEntity());
    } on DioException catch (e) {
      return ApiErrorResult<ChangePasswordEntity>(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult<ChangePasswordEntity>(
        failure: Failure(errorMessage: e.toString()),
      );
    }
  }

  @override
  Future<ApiResult<EditProfileEntity>> editProfile(
    EditProfileInputModel model,
  ) async {
    try {
      EditProfileDto result = await _dataSource.editProfile(model);
      return ApiSuccessResult<EditProfileEntity>(data: result.toEntity());
    } on DioException catch (e) {
      return ApiErrorResult<EditProfileEntity>(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult<EditProfileEntity>(
        failure: Failure(errorMessage: e.toString()),
      );
    }
  }
}
