import 'package:online_exam/features/subject_exams/domain/entities/exams_on_subject_entity.dart';

import '../../../../core/errors/api_results.dart';

abstract interface class GetAllExamsDataSource {
  Future<ApiResult<List<ExamsEntity>>> getExamsOnSubject(String subjectId);
}
