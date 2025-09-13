import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF8F9FA), Color(0xFFE9ECEF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            // أشكال هندسية ديكورية
            Positioned(
              top: height * 0.05,
              right: width * 0.1,
              child: Container(
                width: width * 0.2,
                height: width * 0.2,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD8A9).withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Positioned(
              top: height * 0.15,
              left: width * 0.05,
              child: Container(
                width: width * 0.15,
                height: width * 0.15,
                decoration: BoxDecoration(
                  color: const Color(0xFFA0C3D2).withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: height * 0.1,
              left: width * 0.1,
              child: Container(
                width: width * 0.25,
                height: width * 0.25,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAC7C7).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Positioned(
              bottom: height * 0.2,
              right: width * 0.05,
              child: Container(
                width: width * 0.1,
                height: width * 0.1,
                decoration: BoxDecoration(
                  color: const Color(0xFF9BA17B).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            // المحتوى الرئيسي
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.08),

                  // زر العودة
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    color: Colors.black54,
                  ),
                  SizedBox(height: height * 0.02),

                  // العنوان الرئيسي
                  Text(
                    "Create Account",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: width * 0.08,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * 0.01),

                  // الوصف
                  Text(
                    "Fill your information below or register with your social account",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: height * 0.05),

                  // حقل الاسم
                  _buildTextField(
                    hintText: "Full Name",
                    prefixIcon: Icons.person_outline,
                    isFirst: true,
                  ),
                  SizedBox(height: height * 0.025),

                  // حقل الإيميل
                  _buildTextField(
                    hintText: "Email Address",
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: height * 0.025),

                  // حقل كلمة المرور
                  _buildTextField(
                    hintText: "Password",
                    prefixIcon: Icons.lock_outline,
                    isPassword: true,
                  ),
                  SizedBox(height: height * 0.025),

                  // حقل تأكيد كلمة المرور
                  _buildTextField(
                    hintText: "Confirm Password",
                    prefixIcon: Icons.lock_outline,
                    isPassword: true,
                    isLast: true,
                  ),
                  SizedBox(height: height * 0.03),

                  // شروط الخدمة
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: const Icon(
                          Icons.check,
                          size: 16,
                          color: Color(0xFF6C4AB6),
                        ),
                      ),
                      SizedBox(width: width * 0.03),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: "I agree with ",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: "Terms",
                                style: TextStyle(
                                  color: Color(0xFF6C4AB6),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: " and "),
                              TextSpan(
                                text: "Privacy",
                                style: TextStyle(
                                  color: Color(0xFF6C4AB6),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.04),

                  // زر التسجيل
                  Container(
                    width: double.infinity,
                    height: height * 0.065,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF6C4AB6).withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6C4AB6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: width * 0.045,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.04),

                  // فاصل
                  Center(
                    child: Text(
                      "Or sign up with",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),

                  // أزرار وسائل التواصل الاجتماعي
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialButton("assets/google.png", "Google"),
                      SizedBox(width: width * 0.05),
                      _buildSocialButton("assets/facebook.png", "Facebook"),
                      SizedBox(width: width * 0.05),
                      _buildSocialButton("assets/twitter.png", "Twitter"),
                    ],
                  ),
                  SizedBox(height: height * 0.04),

                  //已经有了账号？
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                        ),
                        children: [
                          TextSpan(
                            text: "Sign In",
                            style: TextStyle(
                              color: const Color(0xFF6C4AB6),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.05),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // دالة مساعدة لإنشاء حقول النص
  Widget _buildTextField({
    required String hintText,
    required IconData prefixIcon,
    bool isPassword = false,
    bool isFirst = false,
    bool isLast = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: isFirst ? Radius.circular(12) : Radius.zero,
          bottom: isLast ? Radius.circular(12) : Radius.zero,
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        obscureText: isPassword,
        style: const TextStyle(color: Colors.black87),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          prefixIcon: Icon(prefixIcon, color: const Color(0xFF6C4AB6)),
          suffixIcon: isPassword
              ? const Icon(Icons.visibility_off_outlined, color: Colors.grey)
              : null,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          filled: false,
          border: InputBorder.none,
        ),
      ),
    );
  }

  // دالة مساعدة لإنشاء أزرار وسائل التواصل
  Widget _buildSocialButton(String imagePath, String text) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // في التطبيق الحقيقي، استخدم Image.asset للصور
          // هنا نستخدم أيقونة بديلة للتوضيح
          Icon(
            Icons.circle,
            color: Colors.grey.shade300,
            size: 24,
          ),
          SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}