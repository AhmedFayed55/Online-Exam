class EditProfileInputModel {
  EditProfileInputModel({
    this.email,
    this.firstName,
    this.lastName,
    this.userName,
    this.phone,
  });

  EditProfileInputModel.fromJson(dynamic json) {
    userName = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
  }

  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = userName;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    return map;
  }
}
