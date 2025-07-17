import 'package:online_exam/core/enums/auth_enum.dart';
import 'package:online_exam/core/helpers/regex.dart';

String? authValidator({
  required String value,
  required FiledType filedType,
  String? confrimPassword,
}) {
  switch (filedType) {
    case FiledType.userName:
      if (value.isEmpty) return 'Username is required';
      if (!AppRegExp.isNameValid(value)) {
        return "this username is not valid";
      }
      break;
    case FiledType.firstName:
      if (value.isEmpty) return 'First name is required';
      if (!AppRegExp.isNameValid(value)) {
        return "this first name is not valid";
      }
      break;
    case FiledType.lastName:
      if (value.isEmpty) return 'Last name is required';
      if (!AppRegExp.isNameValid(value)) {
        return "this last name is not valid";
      }
      break;
    case FiledType.email:
      if (value.isEmpty) return 'Email is required';
      if (!AppRegExp.isEmailValid(value)) {
        return "this email is not valid";
      }
      break;
    case FiledType.password:
      if (value.isEmpty) return 'Password is required';
      if (!AppRegExp.isPasswordValid(value)) {
        return "this password is not valid";
      }
      break;
    case FiledType.confrimPassword:
      if (value.isEmpty) return 'Confirm Password is required';
      if (value != confrimPassword) {
        return "password  not match";
      }
      break;
    case FiledType.phoneNumber:
      if (value.isEmpty) return 'Phone number is required';

      if (!AppRegExp.isPhoneNumberValid(value)) {
        return "this phone number is not valid";
      }
      break;
  }
  return null;
}
