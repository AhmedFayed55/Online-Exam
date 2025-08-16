import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/features/main_layout/explore/data/datasources/remote_data_source.dart';
import 'package:online_exam/features/main_layout/explore/domain/entities/subject_entity.dart';
import 'package:online_exam/features/main_layout/explore/domain/repositories/repo.dart';

@Injectable(as: ExploreRepository)
class ExploreRepositoryImpl implements ExploreRepository {
  final ExploreRemoteDataSource _remoteDataSource;
  ExploreRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResult<List<SubjectEntity>>> getSubjects() async {
    ApiResult<List<SubjectEntity>> response = await _remoteDataSource
        .getSubjects();
    return response;
  }
}
