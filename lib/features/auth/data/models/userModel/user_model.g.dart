// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModelDto _$UserModelDtoFromJson(Map<String, dynamic> json) => UserModelDto(
  message: json['message'] as String,
  token: json['token'] as String,
  user: UserInfoDto.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserModelDtoToJson(UserModelDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
    };
