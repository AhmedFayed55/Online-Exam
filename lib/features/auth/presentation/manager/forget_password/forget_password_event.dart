sealed class ForgetPasswordEvent {}

class RequestPasswordResetEvent extends ForgetPasswordEvent {}

class ResetPasswordEvent extends ForgetPasswordEvent {}

class ConfirmCodeEvent extends ForgetPasswordEvent {}

class ResendCodeEvent extends ForgetPasswordEvent {}
