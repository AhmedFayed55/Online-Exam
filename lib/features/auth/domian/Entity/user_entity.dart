class UserEntity {
  String userName;
  String firstName;
  String lastName;
  String email;
  String phone;
  String role;
  bool isVerified;
  String id;
  DateTime createdAt;
  UserEntity({
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
}
