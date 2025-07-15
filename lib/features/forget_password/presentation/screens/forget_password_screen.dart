import 'package:flutter/material.dart';
import '../../../../config/routing/app_routes.dart';
import '../../api_services/api_services.dart';
import '../../data/data_sources/auth_remote_datasource_impl.dart';
import '../../data/repos/auth_repository_impl.dart';
import '../../domain/usecase/forget_password_usecase.dart';
import '../controller/forget_password_controller.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  late final ForgetPasswordController controller;

  @override
  @override
  void initState() {
    super.initState();

    final apiService = ApiService();
    final remote = AuthRemoteDatasourceImpl(apiService);
    final repo = AuthRepositoryImpl(remote);
    final usecase = ForgotPasswordUseCase(repo);
    controller = ForgetPasswordController(usecase);
  }


  Future<void> _handleForgotPassword() async {
    final email = emailController.text.trim();

    setState(() => isLoading = true);

    final result = await controller.sendForgotPassword(email); // ← هنا بيتحقق الإيميل

    if (!mounted) return;
    setState(() => isLoading = false);

    if (result == null) {
      // success
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Verification code sent!')),
      );
      Navigator.pushNamed(context, AppRoutes.verificationRoute);
    } else {
      // error (زي invalid email)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result)),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Password"),
      ),
      body: Column(
        children: [
          buildForgetPasswordRow(),
          buildInstructionRow(),
          buildEmailField(),
          buildContinueButton(),
        ],
      ),
    );
  }

  Widget buildForgetPasswordRow() => Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top: 40),
    child: const Text(
      "Forget password",
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
      "Please enter your email associated to\nyour account",
      textAlign: TextAlign.center,
    ),
  );

  Widget buildEmailField() => Container(
    padding: const EdgeInsets.only(top: 36, left: 16, right: 16),
    child: TextField(
      controller: emailController,
      style: const TextStyle(color: Colors.black),
      decoration: const InputDecoration(
        labelText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: "Enter your email",
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Colors.grey),
      ),
    ),
  );

  Widget buildContinueButton() => Container(
    padding: const EdgeInsets.only(top: 68),
    width: 400,
    height: 120,
    child: ElevatedButton(
      onPressed: isLoading ? null : _handleForgotPassword,
      child: isLoading
          ? const CircularProgressIndicator()
          : const Text("Continue"),
    ),
  );
}
