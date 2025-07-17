import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/auth/domain/entities/login/user_entity.dart';
import 'package:online_exam/features/auth/domian/Entity/user_entity.dart';
part 'user.g.dart';

@JsonSerializable()
class UserInfoDto {
  @JsonKey(name: '_id')
  String id;
  @JsonKey(name: 'username')
  String userName;
  String firstName;
  String lastName;
  String email;
  String phone;
  String role;
  bool isVerified;
  String createdAt;

  UserInfoDto({
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.role,
    required this.isVerified,
    required this.id,
    required this.createdAt,
  });

  factory UserInfoDto.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoDtoToJson(this);

  UserEntity toEntity() => UserEntity(
    username: userName,
    firstName: firstName,
    lastName: lastName,
    email: email,
    phone: phone,
    role: role,
    isVerified: isVerified,
    id: id,
    createdAt: createdAt,
  );
}
