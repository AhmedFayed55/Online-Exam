abstract class AuthRemoteDatasource {
  Future<void> forgotPassword(String email);
  Future<void> verifyCode(String code);
}
