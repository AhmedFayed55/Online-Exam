import 'package:json_annotation/json_annotation.dart';
part 'register_input_model.g.dart';

@JsonSerializable()
class RegisterInputModel {
  @JsonKey(name: 'username')
  final String userName;
  @JsonKey(name: 'firstName')
  final String firstName;
  @JsonKey(name: 'lastName')
  final String lastName;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'rePassword')
  final String rePassword;
  @JsonKey(name: 'phone')
  final String phoneNumber;
  RegisterInputModel({
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phoneNumber,
  });
  Map<String, dynamic> toJson() => _$RegisterInputModelToJson(this);
}
