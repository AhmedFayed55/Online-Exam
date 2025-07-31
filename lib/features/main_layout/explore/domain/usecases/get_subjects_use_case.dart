// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/features/main_layout/explore/domain/entities/subject_entity.dart';
import 'package:online_exam/features/main_layout/explore/domain/repositories/repo.dart';

@injectable
class GetSubjectsUseCase {
  final ExploreRepository _subjectRepository;
  GetSubjectsUseCase(this._subjectRepository);

  Future<ApiResult<List<SubjectEntity>>> invoke({required String token}) =>
      _subjectRepository.getSubjects(token: token);
}
