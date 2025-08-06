class ForgetPasswordInputModel {
  final String email;

  ForgetPasswordInputModel({required this.email});

  Map<String, dynamic> toJson() => {'email': email};
}
