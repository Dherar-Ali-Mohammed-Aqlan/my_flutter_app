import 'package:flutter/material.dart';
import 'package:store/screens/login_page.dart';
import 'package:store/screens/reset_password_page.dart';
import 'package:store/screens/store_page.dart';
import 'package:store/screens/signup_page.dart';
import 'package:store/screens/home_page.dart'; // استيراد صفحة Home

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: "Roboto",
      ),
      home: const SplashPage(), // الصفحة الأولى التي تظهر
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/store': (context) => const StorePage(),
        '/reset': (context) => const ResetPasswordPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}

// صفحة Splash/HomePage المؤقتة
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // الانتقال بعد 5 ثوانٍ مع تأثير Fade
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final opacity = animation.drive(Tween(begin: 0.0, end: 1.0));
            return FadeTransition(
              opacity: opacity,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 800),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const HomePage(); // عرض الصفحة الرئيسية
  }
}
