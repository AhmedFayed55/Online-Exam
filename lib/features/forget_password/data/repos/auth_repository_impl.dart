import '../../domain/repo/auth_repo.dart';
import '../data_sources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<void> forgotPassword(String email) {
    return remote.forgotPassword(email);
  }

  @override
  Future<void> verifyCode(String code) {
    return remote.verifyCode(code);
  }
}
