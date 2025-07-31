import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/features/subject_exams/domain/repositories/get_all_exams_repo.dart';

import '../entities/exams_on_subject_entity.dart';

@injectable
class GetExamsOnSubjectUseCase {
  GetExamsOnSubjectUseCase(this._repository);

  final GetAllExamsRepository _repository;

  Future<ApiResult<List<ExamsEntity>>> invoke(String subjectId) =>
      _repository.getExamsOnSubject(subjectId);
}
