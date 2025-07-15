import 'package:flutter/material.dart';
import 'package:online_exam/core/helpers/spacing.dart';

class RowTextField extends StatelessWidget {
  const RowTextField({
    super.key,
    required this.validator1,
    required this.validator2,
    required this.controller1,
    required this.controller2,
    required this.hint1,
    required this.label1,
    required this.hint2,
    required this.label2,
    this.obscureText1 = false,
    this.obscureText2 = false,
    this.onChanged1,
    this.onChanged2,
    this.suffixIcon1,
    this.suffixIcon2,
  });

  final String? Function(String?)? validator1, validator2;
  final TextEditingController controller1;
  final TextEditingController controller2;
  final String hint1, label1, hint2, label2;
  final bool obscureText1, obscureText2;
  final void Function(String)? onChanged1;
  final void Function(String)? onChanged2;
  final Widget? suffixIcon1, suffixIcon2;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextFormField(
              onChanged: onChanged1,
              obscureText: obscureText1,
              validator: validator1,
              controller: controller1,
              decoration: InputDecoration(
                hintText: hint1,
                labelText: label1,
                suffixIcon: suffixIcon1,
              ),
            ),
          ),
          horizontalSpace(17),
          Expanded(
            child: TextFormField(
              onChanged: onChanged2,
              obscureText: obscureText2,
              validator: validator2,
              controller: controller2,
              decoration: InputDecoration(
                hintText: hint2,
                labelText: label2,
                suffixIcon: suffixIcon2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
