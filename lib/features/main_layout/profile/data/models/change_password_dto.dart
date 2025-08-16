import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/main_layout/profile/domain/entities/change_password_entity.dart';

part 'change_password_dto.g.dart';

@JsonSerializable()
class ChangePasswordDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;

  ChangePasswordDto({this.message, this.token});

  factory ChangePasswordDto.fromJson(Map<String, dynamic> json) {
    return _$ChangePasswordDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ChangePasswordDtoToJson(this);
  }

  ChangePasswordEntity toEntity() =>
      ChangePasswordEntity(message: message, token: token);
}
