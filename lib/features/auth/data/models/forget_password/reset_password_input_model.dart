class ResetPasswordInputModel {
  final String email;
  final String confirmPass;

  ResetPasswordInputModel({required this.email, required this.confirmPass});

  Map<String, dynamic> toJson() => {'email': email, 'newPassword': confirmPass};
}
