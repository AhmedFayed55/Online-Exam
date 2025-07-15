import '../repo/auth_repo.dart';

class VerifyCodeUseCase {
  final AuthRepository repository;

  VerifyCodeUseCase(this.repository);

  Future<String?> call(String code) async {
    try {
      await repository.verifyCode(code);
      return null; // Success
    } catch (e) {
      return e.toString(); // Error message
    }
  }
}
