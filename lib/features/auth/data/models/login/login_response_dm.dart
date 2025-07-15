import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/auth/data/models/login/user_dm.dart';

part 'login_response_dm.g.dart';

@JsonSerializable()
class LoginResponseDm {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "user")
  final UserDm? user;

  LoginResponseDm({this.message, this.token, this.user});

  factory LoginResponseDm.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseDmFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginResponseDmToJson(this);
  }
}
