import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/auth/data/models/userModel/user.dart';
import 'package:online_exam/features/main_layout/profile/domain/entities/edit_profile_entity.dart';

part 'edit_profile_dto.g.dart';

@JsonSerializable()
class EditProfileDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final UserInfoDto? user;

  EditProfileDto({this.message, this.user});

  factory EditProfileDto.fromJson(Map<String, dynamic> json) {
    return _$EditProfileDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$EditProfileDtoToJson(this);
  }

  EditProfileEntity toEntity() {
    return EditProfileEntity(message: message, user: user?.toEntity());
  }
}
