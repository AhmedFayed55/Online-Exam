// import 'package:json_annotation/json_annotation.dart';
// import '../../../domain/entities/login/user_entity.dart';
//
// part 'user_dm.g.dart';
//
// @JsonSerializable()
// class UserDm {
//   @JsonKey(name: "_id")
//   final String? id;
//   @JsonKey(name: "username")
//   final String? username;
//   @JsonKey(name: "firstName")
//   final String? firstName;
//   @JsonKey(name: "lastName")
//   final String? lastName;
//   @JsonKey(name: "email")
//   final String? email;
//   @JsonKey(name: "phone")
//   final String? phone;
//   @JsonKey(name: "role")
//   final String? role;
//   @JsonKey(name: "isVerified")
//   final bool? isVerified;
//   @JsonKey(name: "createdAt")
//   final String? createdAt;
//
//   UserDm({
//     this.id,
//     this.username,
//     this.firstName,
//     this.lastName,
//     this.email,
//     this.phone,
//     this.role,
//     this.isVerified,
//     this.createdAt,
//   });
//
//   factory UserDm.fromJson(Map<String, dynamic> json) {
//     return _$UserDmFromJson(json);
//   }
//
//   Map<String, dynamic> toJson() {
//     return _$UserDmToJson(this);
//   }
//
//   UserEntity toEntity() {
//     return UserEntity(
//       id: id,
//       username: username,
//       firstName: firstName,
//       lastName: lastName,
//       email: email,
//       phone: phone,
//       role: role,
//       isVerified: isVerified,
//       createdAt: createdAt,
//     );
//   }
// }
