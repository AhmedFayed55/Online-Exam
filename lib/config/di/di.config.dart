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
import 'module/dio_module.dart' as _i556;

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
    gh.factory<_i530.ApiService>(
      () => _i530.ApiService(gh<_i361.Dio>(), baseUrl: gh<String>()),
    );
    gh.factory<_i324.AuthRemoteDataSource>(
      () => _i336.AuthRemoteDataSourceImpl(apiService: gh<_i530.ApiService>()),
    );
    gh.factory<_i601.AuthRepo>(
      () => _i984.AuthRepoImpl(
        remoteDataSource: gh<_i324.AuthRemoteDataSource>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i556.DioModule {}
