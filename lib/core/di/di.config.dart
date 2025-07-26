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
    gh.factory<_i723.AuthRepository>(
      () => _i662.AuthRepositoryImpl(gh<_i147.AuthRemoteDataSource>()),
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
    gh.factory<_i920.SignUpCubit>(
      () => _i920.SignUpCubit(gh<_i960.SignUpUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i271.DioModule {}
