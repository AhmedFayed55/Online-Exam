import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/auth/domain/entities/forget_password/reset_password_response_entity.dart';

part 'reset_password_response_dto.g.dart';

@JsonSerializable()
class ResetPasswordResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;

  ResetPasswordResponseDto({this.message, this.token});

  factory ResetPasswordResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResetPasswordResponseDtoToJson(this);
  }

  ResetPasswordResponseEntity toEntity() {
    return ResetPasswordResponseEntity(message: message, token: token);
  }
}
