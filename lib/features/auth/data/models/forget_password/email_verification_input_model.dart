class EmailVerificationInputModel {
  final String code;

  EmailVerificationInputModel({required this.code});

  Map<String, dynamic> toJson() => {'resetCode': code};
}
