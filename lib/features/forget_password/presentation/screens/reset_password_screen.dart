import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
          padding: const EdgeInsets.only(left: 16),
        ),
        title: const Text("Password"),
        leadingWidth: 24,
      ),
     body: Column(
        children: [
          buildResetPasswordRow(),
          buildInstructionRow(),
          buildNewPasswordField(),
          buildConfirmPasswordField(),
          buildContinueButton(),
        ],
      ),
    );
  }

  Widget buildResetPasswordRow() => Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top: 40),
    child: const Text(
      "Reset password",
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  Widget buildInstructionRow() => Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top: 16),
    child: const Text(
      "Password must not be empty and must contain\n6 characters with upper case letter and one\nnumber at least",
      textAlign: TextAlign.center,
    ),
  );

  Widget buildNewPasswordField() => Container(
    padding: const EdgeInsets.only(top: 36, left: 16, right: 16),
    child: const TextField(

      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: "New Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: "Enter your password",
        labelStyle: TextStyle(color: Colors.grey),
        hintStyle: TextStyle(color: Colors.grey),
      ),
    ),
  );

  Widget buildConfirmPasswordField() => Container(
    padding: const EdgeInsets.only(top: 36, left: 16, right: 16),
    child: const TextField(

      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: "Confirm password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: "Confirm password",
        labelStyle: TextStyle(color: Colors.grey),
        hintStyle: TextStyle(color: Colors.grey),
      ),
    ),
  );

  Widget buildContinueButton() => Container(
    padding: const EdgeInsets.only(top: 68),
    width: 400,
    height: 120,
    child: ElevatedButton(
      onPressed: (){},
      child: const Text("Continue")
    ),
  );
}