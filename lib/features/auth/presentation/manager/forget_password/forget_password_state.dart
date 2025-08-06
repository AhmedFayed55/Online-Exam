class ForgetPasswordState {
  bool isLoadingResetPassword = false;
  bool isLoadingConfirmCode = false;
  bool isLoadingRequestPasswordReset = false;
  bool isLoadingResendCode = false;
  bool invalidCode = false;

  String? errorRequestPasswordReset;
  String? errorConfirmCode;
  String? errorResetPassword;

  String? successRequestPasswordReset;
  String? successConfirmCode;
  String? successResetPassword;

  ForgetPasswordState({
    this.isLoadingResetPassword = false,
    this.isLoadingConfirmCode = false,
    this.isLoadingRequestPasswordReset = false,
    this.isLoadingResendCode = false,
    this.invalidCode = false,
    this.errorRequestPasswordReset,
    this.errorConfirmCode,
    this.errorResetPassword,
    this.successRequestPasswordReset,
    this.successConfirmCode,
    this.successResetPassword,
  });

  ForgetPasswordState copyWith({
    bool? isLoadingResetPassword,
    bool? isLoadingConfirmCode,
    bool? isLoadingRequestPasswordReset,
    bool? isLoadingResendCode,
    bool? invalidCode,
    String? errorRequestPasswordReset,
    String? errorConfirmCode,
    String? errorResetPassword,
    String? successRequestPasswordReset,
    String? successConfirmCode,
    String? successResetPassword,
  }) {
    return ForgetPasswordState(
      isLoadingResetPassword:
          isLoadingResetPassword ?? this.isLoadingResetPassword,
      isLoadingConfirmCode: isLoadingConfirmCode ?? this.isLoadingConfirmCode,
      isLoadingRequestPasswordReset:
          isLoadingRequestPasswordReset ?? this.isLoadingRequestPasswordReset,
      isLoadingResendCode: isLoadingResendCode ?? this.isLoadingResendCode,
      invalidCode: invalidCode ?? this.invalidCode,
      errorRequestPasswordReset:
          errorRequestPasswordReset ?? this.errorRequestPasswordReset,
      errorConfirmCode: errorConfirmCode ?? this.errorConfirmCode,
      errorResetPassword: errorResetPassword ?? this.errorResetPassword,
      successRequestPasswordReset:
          successRequestPasswordReset ?? this.successRequestPasswordReset,
      successConfirmCode: successConfirmCode ?? this.successConfirmCode,
      successResetPassword: successResetPassword ?? this.successResetPassword,
    );
  }
}
