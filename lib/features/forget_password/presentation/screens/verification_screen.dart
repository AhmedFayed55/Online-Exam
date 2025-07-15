import 'package:flutter/material.dart';
import 'package:online_exam/config/routing/app_routes.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../api_services/api_services.dart';
import '../../data/data_sources/auth_remote_datasource_impl.dart';
import '../../data/repos/auth_repository_impl.dart';
import '../../domain/usecase/verify_code_usecase.dart';
import '../controller/verify_code_controller.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late final VerifyCodeController controller;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    controller = VerifyCodeController(
      VerifyCodeUseCase(
        AuthRepositoryImpl(
          AuthRemoteDatasourceImpl(ApiService()),
        ),
      ),
    );
  }

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text('Email verification'),
            const SizedBox(height: 8),
            const Text(
              'Please enter your code that was sent to your\nemail address',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            PinCodeTextField(
              appContext: context,
              length: 6,
              cursorColor: const Color(0xffDFE7F7),
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 68,
                fieldWidth: 50,
                inactiveColor: Colors.grey[300],
                activeColor: Colors.blueAccent,
                selectedColor: Colors.black,
              ),
              onChanged: (_) {},
              onCompleted: (value) => verifyOtp(value),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Didn't receive code?"),
                TextButton(
                  onPressed: () {
                    // TODO: تنفيذ إعادة إرسال OTP
                  },
                  child: const Text("Resend"),
                ),
              ],
            ),
            if (isLoading)
              const Padding(
                padding: EdgeInsets.only(top: 24.0),
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }

  void verifyOtp(String otp) async {
    if (otp.length != 6) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a 6-digit code')),
      );
      return;
    }

    setState(() => isLoading = true);

    final result = await controller.verify(otp); // ← otp is String

    if (!mounted) return;
    setState(() => isLoading = false);

    if (result == null) {
      Navigator.pushNamed(context, AppRoutes.signInRoute);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result)),
      );
    }
  }
}
