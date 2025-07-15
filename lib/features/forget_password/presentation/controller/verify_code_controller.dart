import '../../domain/usecase/verify_code_usecase.dart';

class VerifyCodeController {
  final VerifyCodeUseCase verifyCodeUseCase;

  VerifyCodeController(this.verifyCodeUseCase);

  Future<String?> verify(String code) async {
    return await verifyCodeUseCase(code);
  }
}
