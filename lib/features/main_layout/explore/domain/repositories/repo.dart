import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/features/main_layout/explore/domain/entities/subject_entity.dart';

abstract interface class ExploreRepository {
  Future<ApiResult<List<SubjectEntity>>> getSubjects({required String token});
}
