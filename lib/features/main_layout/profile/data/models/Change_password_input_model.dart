class ChangePasswordInputModel {
  ChangePasswordInputModel({this.oldPassword, this.password, this.rePassword});

  ChangePasswordInputModel.fromJson(dynamic json) {
    oldPassword = json['oldPassword'];
    password = json['password'];
    rePassword = json['rePassword'];
  }

  String? oldPassword;
  String? password;
  String? rePassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['oldPassword'] = oldPassword;
    map['password'] = password;
    map['rePassword'] = rePassword;
    return map;
  }
}
