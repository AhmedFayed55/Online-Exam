import '../../domain/usecase/forget_password_usecase.dart';

class ForgetPasswordController {
  final ForgotPasswordUseCase forgotPasswordUseCase;

  ForgetPasswordController(this.forgotPasswordUseCase);

  Future<String?> sendForgotPassword(String email) async {
    if (email.trim().isEmpty) {
      return 'Please enter your email';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email.trim())) {
      return 'Please enter a valid email';
    }

    try {
      await forgotPasswordUseCase(email.trim());
      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
