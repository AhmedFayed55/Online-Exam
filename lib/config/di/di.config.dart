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

import '../../apiSevices/api_service.dart' as _i530;
import '../../apiSevices/auth_remote_data_source_impl.dart' as _i336;
import '../../features/auth/data/dataSouurces/auth_remote_data_srource.dart'
    as _i324;
import '../../features/auth/data/repo/auth_repo_impl.dart' as _i984;
import '../../features/auth/domian/repo/auth_repo.dart' as _i601;
import '../../features/auth/domian/useCases/sign_up_usecase.dart' as _i804;
import '../../features/auth/presentation/manger/cubit/auth_cubit.dart' as _i58;
import 'module/dio_module.dart' as _i556;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i528.PrettyDioLogger>(
      () => dioModule.providePrettyDioLogger(),
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.provideDio(gh<_i528.PrettyDioLogger>()),
    );
    gh.lazySingleton<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<_i530.ApiService>(
      () => _i530.ApiService(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'BaseUrl'),
      ),
    );
    gh.factory<_i324.AuthRemoteDataSource>(
      () => _i336.AuthRemoteDataSourceImpl(apiService: gh<_i530.ApiService>()),
    );
    gh.factory<_i601.AuthRepo>(
      () => _i984.AuthRepoImpl(
        remoteDataSource: gh<_i324.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i804.SignUpUseCase>(
      () => _i804.SignUpUseCase(gh<_i601.AuthRepo>()),
    );
    gh.factory<_i58.AuthCubit>(() => _i58.AuthCubit(gh<_i804.SignUpUseCase>()));
    return this;
  }
}

class _$DioModule extends _i556.DioModule {}

class _$RegisterModule extends _i556.RegisterModule {}
