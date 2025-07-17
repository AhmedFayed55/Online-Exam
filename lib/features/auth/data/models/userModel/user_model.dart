import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/auth/data/models/userModel/user.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModelDto {
  final String message;
  final String token;
  final UserInfoDto user;
  UserModelDto({
    required this.message,
    required this.token,
    required this.user,
  });

  factory UserModelDto.fromJson(Map<String, dynamic> json) =>
      _$UserModelDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelDtoToJson(this);
}
