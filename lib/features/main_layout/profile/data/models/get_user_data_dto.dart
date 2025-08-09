import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/auth/data/models/userModel/user.dart';

part 'get_user_data_dto.g.dart';

@JsonSerializable()
class GetUserDataDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final UserInfoDto? user;

  GetUserDataDto({this.message, this.user});

  factory GetUserDataDto.fromJson(Map<String, dynamic> json) {
    return _$GetUserDataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetUserDataDtoToJson(this);
  }
}
