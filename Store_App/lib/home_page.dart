import 'package:flutter/material.dart';

// استيراد الصفحات
import 'login_page.dart';
import 'signup_page.dart';
import 'store_page.dart';
import 'reset_password_page.dart';
import 'forgot_password_page.dart';
import 'change_password_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final double phoneAspectRatio = 0.55; // ارتفاع/عرض الهاتف

  Widget buildPhoneFrame(Widget screen, double width, String label) {
    final height = width / phoneAspectRatio;
    return Column(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.05),
                Colors.white.withOpacity(0.15),
              ],
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
            border: Border.all(color: Colors.white24, width: 2),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: screen,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final phoneWidth = screenWidth / 2.2; // حجم كل شاشة

    return Scaffold(
      appBar: AppBar(
        title: const Text("App Screens Preview"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.black87],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            child: Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 20,
                spacing: 20,
                children: [
                  buildPhoneFrame(const LoginPage(), phoneWidth, "Login"),
                  buildPhoneFrame(const SignUpPage(), phoneWidth, "Sign Up"),
                  buildPhoneFrame(const ForgotPasswordPage(), phoneWidth, "Forgot Password"),
                  buildPhoneFrame(const ResetPasswordPage(), phoneWidth, "Reset Password"),
                  buildPhoneFrame(const ChangePasswordPage(), phoneWidth, "Change Password"),
                  buildPhoneFrame(const StorePage(), phoneWidth, "Store"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
