import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/core/helpers/shared_pref.dart';
import 'package:online_exam/core/network/api_services.dart';
import 'package:online_exam/core/utils/app_constants.dart';
import 'package:online_exam/features/subject_exams/data/data_sources/get_all_exams_ds.dart';
import 'package:online_exam/features/subject_exams/data/model/get_exams_on_subject_dto.dart';
import 'package:online_exam/features/subject_exams/domain/entities/exams_on_subject_entity.dart';
import '../../../../core/errors/failure.dart';

@Injectable(as: GetAllExamsDataSource)
class GetAllExamsDataSourceImpl implements GetAllExamsDataSource {
  GetAllExamsDataSourceImpl(this._apiServices);

  final ApiServices _apiServices;

  @override
  Future<ApiResult<List<ExamsEntity>>> getExamsOnSubject(
    String subjectId,
  ) async {
    try {
      final token = SharedPrefHelper.getData(key: AppConstants.token);
      GetExamsOnSubjectDto examsDto = await _apiServices.getExamsOnSubject(
        token as String,
        subjectId,
      );

      List<ExamsEntity> examsListEntity =
          examsDto.exams?.map((exam) => exam.toEntity()).toList() ?? [];

      return ApiSuccessResult<List<ExamsEntity>>(data: examsListEntity);
    } on DioException catch (e) {
      return ApiErrorResult<List<ExamsEntity>>(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult<List<ExamsEntity>>(
        failure: Failure(errorMessage: e.toString()),
      );
    }
  }
}
