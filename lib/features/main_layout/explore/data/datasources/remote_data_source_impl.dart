import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/core/errors/failure.dart';
import 'package:online_exam/core/network/api_services.dart';
import 'package:online_exam/features/main_layout/explore/data/datasources/remote_data_source.dart';
import 'package:online_exam/features/main_layout/explore/data/models/subjects_dto/subjects_dto.dart';
import 'package:online_exam/features/main_layout/explore/domain/entities/subject_entity.dart';

@Injectable(as: ExploreRemoteDataSource)
class ExploreRemoteDataSourceImpl implements ExploreRemoteDataSource {
  final ApiServices _apiServices;

  ExploreRemoteDataSourceImpl(this._apiServices);

  @override
  Future<Apiresult<List<SubjectEntity>>> getSubjects({
    required String token,
  }) async {
    try {
      SubjectsDto subjectsDto = await _apiServices.getSubjects(token);

      List<SubjectEntity> subjectsEntityList =
          subjectsDto.subjects?.map((subject) => subject.toEntity()).toList() ??
          [];

      return ApiSuccessResult<List<SubjectEntity>>(data: subjectsEntityList);
    } on DioException catch (e) {
      return ApiErrorResult<List<SubjectEntity>>(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult<List<SubjectEntity>>(
        failure: Failure(errorMessage: e.toString()),
      );
    }
  }
}
