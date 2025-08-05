// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../features/auth/data/data_sources/auth_remote_ds.dart' as _i147;
import '../../features/auth/data/data_sources/auth_remote_ds_impl.dart'
    as _i570;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i662;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i723;
import '../../features/auth/domain/use_cases/login_use_case.dart' as _i1038;
import '../../features/auth/domain/use_cases/sign_up_usecase.dart' as _i960;
import '../../features/auth/presentation/manager/auth_cubit.dart' as _i888;
import '../../features/auth/presentation/manager/signUp/sign_up_cubit.dart'
    as _i920;
import '../../features/Exam/data/datasources/exam_remote_data_source.dart'
    as _i589;
import '../../features/Exam/data/datasources/exam_remote_data_source_impl.dart'
    as _i1018;
import '../../features/Exam/data/repositories/exam_repo_impl.dart' as _i393;
import '../../features/Exam/domain/repositories/exam_repo.dart' as _i713;
import '../../features/Exam/domain/usecases/check_exam_answers_use_case.dart'
    as _i71;
import '../../features/Exam/domain/usecases/get_questions_use_case.dart'
    as _i593;
import '../../features/Exam/presentation/manger/exam_cubit.dart' as _i747;
import '../../features/main_layout/explore/data/datasources/remote_data_source.dart'
    as _i572;
import '../../features/main_layout/explore/data/datasources/remote_data_source_impl.dart'
    as _i720;
import '../../features/main_layout/explore/data/repositories/repo_impl.dart'
    as _i960;
import '../../features/main_layout/explore/domain/repositories/repo.dart'
    as _i10;
import '../../features/main_layout/explore/domain/usecases/get_subjects_use_case.dart'
    as _i678;
import '../../features/main_layout/explore/presentation/manger/cubit/explore_cubit.dart'
    as _i1068;
import '../network/api_services.dart' as _i804;
import '../network/di.dart' as _i271;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.lazySingleton<_i528.PrettyDioLogger>(
      () => dioModule.providePrettyDioLogger(),
    );
    gh.factory<_i804.ApiServices>(() => _i804.ApiServices(gh<_i361.Dio>()));
    gh.factory<_i147.AuthRemoteDataSource>(
      () => _i570.AuthRemoteDataSourceImpl(gh<_i804.ApiServices>()),
    );
    gh.factory<_i572.ExploreRemoteDataSource>(
      () => _i720.ExploreRemoteDataSourceImpl(gh<_i804.ApiServices>()),
    );
    gh.factory<_i589.ExamRemoteDataSource>(
      () => _i1018.ExamRemoteDataSourceImpl(gh<_i804.ApiServices>()),
    );
    gh.factory<_i10.ExploreRepository>(
      () => _i960.ExploreRepositoryImpl(gh<_i572.ExploreRemoteDataSource>()),
    );
    gh.factory<_i713.ExamRepo>(
      () => _i393.ExamRepoImpl(gh<_i589.ExamRemoteDataSource>()),
    );
    gh.factory<_i723.AuthRepository>(
      () => _i662.AuthRepositoryImpl(gh<_i147.AuthRemoteDataSource>()),
    );
    gh.factory<_i593.GetQuestionsUseCase>(
      () => _i593.GetQuestionsUseCase(gh<_i713.ExamRepo>()),
    );
    gh.factory<_i71.CheckExamAnswersUseCase>(
      () => _i71.CheckExamAnswersUseCase(gh<_i713.ExamRepo>()),
    );
    gh.factory<_i678.GetSubjectsUseCase>(
      () => _i678.GetSubjectsUseCase(gh<_i10.ExploreRepository>()),
    );
    gh.factory<_i1068.ExploreCubit>(
      () => _i1068.ExploreCubit(gh<_i678.GetSubjectsUseCase>()),
    );
    gh.factory<_i960.SignUpUseCase>(
      () => _i960.SignUpUseCase(gh<_i723.AuthRepository>()),
    );
    gh.factory<_i1038.LoginUseCase>(
      () => _i1038.LoginUseCase(gh<_i723.AuthRepository>()),
    );
    gh.factory<_i888.AuthCubit>(
      () => _i888.AuthCubit(loginUseCase: gh<_i1038.LoginUseCase>()),
    );
    gh.factory<_i747.ExamCubit>(
      () => _i747.ExamCubit(
        gh<_i593.GetQuestionsUseCase>(),
        gh<_i71.CheckExamAnswersUseCase>(),
      ),
    );
    gh.factory<_i920.SignUpCubit>(
      () => _i920.SignUpCubit(gh<_i960.SignUpUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i271.DioModule {}
