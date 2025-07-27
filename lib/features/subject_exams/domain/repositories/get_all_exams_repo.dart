import '../../../../core/errors/api_results.dart';
import '../entities/exams_on_subject_entity.dart';

abstract interface class GetAllExamsRepository {
  Future<ApiResult<List<ExamsEntity>>> getExamsOnSubject(String subjectId);
}
