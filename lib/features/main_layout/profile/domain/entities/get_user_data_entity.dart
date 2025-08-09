import 'package:online_exam/features/auth/domain/entities/login/user_entity.dart';

class GetUserDataEntity {
  GetUserDataEntity({this.message, this.user});

  String? message;
  UserEntity? user;
}
