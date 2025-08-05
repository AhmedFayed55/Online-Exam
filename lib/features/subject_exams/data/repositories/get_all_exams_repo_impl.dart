import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/api_results.dart';
import '../../domain/entities/exams_on_subject_entity.dart';
import '../../domain/repositories/get_all_exams_repo.dart';
import '../data_sources/get_all_exams_ds.dart';

@Injectable(as: GetAllExamsRepository)
class GetAllExamsRepositoryImpl implements GetAllExamsRepository {
  GetAllExamsRepositoryImpl(this._dataSource);

  final GetAllExamsDataSource _dataSource;

  @override
  Future<ApiResult<List<ExamsEntity>>> getExamsOnSubject(
    String subjectId,
  ) async {
    ApiResult<List<ExamsEntity>> response = await _dataSource.getExamsOnSubject(
      subjectId,
    );

    return response;
  }
}
