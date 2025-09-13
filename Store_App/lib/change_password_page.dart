import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool hoverBtn = false;

  final currentPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();

  bool _showCurrentPass = false;
  bool _showNewPass = false;
  bool _showConfirmPass = false;

  void _updatePassword() {
    // هنا فقط للتجربة - بدون تحقق حقيقي
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Password updated successfully ✅"),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  void dispose() {
    currentPassController.dispose();
    newPassController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Change Password",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.black87],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            // خلفية دوائر
            Positioned(
              top: -height * 0.12,
              left: -width * 0.2,
              child: Container(
                width: width * 0.5,
                height: width * 0.5,
                decoration: const BoxDecoration(
                  color: Color(0xFF3F51B5),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: height * 0.12,
              right: -width * 0.15,
              child: Container(
                width: width * 0.25,
                height: width * 0.25,
                decoration: const BoxDecoration(
                  color: Color(0xFF673AB7),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            // المحتوى
            Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.15),

                    _buildPasswordField(
                      controller: currentPassController,
                      hint: "Current Password",
                      showPass: _showCurrentPass,
                      onToggle: () =>
                          setState(() => _showCurrentPass = !_showCurrentPass),
                      icon: Icons.lock_open,
                    ),
                    SizedBox(height: height * 0.025),

                    _buildPasswordField(
                      controller: newPassController,
                      hint: "New Password",
                      showPass: _showNewPass,
                      onToggle: () =>
                          setState(() => _showNewPass = !_showNewPass),
                      icon: Icons.lock,
                    ),
                    SizedBox(height: height * 0.025),

                    _buildPasswordField(
                      controller: confirmPassController,
                      hint: "Confirm New Password",
                      showPass: _showConfirmPass,
                      onToggle: () =>
                          setState(() => _showConfirmPass = !_showConfirmPass),
                      icon: Icons.lock_outline,
                    ),
                    SizedBox(height: height * 0.04),

                    // زر تحديث كلمة المرور
                    MouseRegion(
                      onEnter: (_) => setState(() => hoverBtn = true),
                      onExit: (_) => setState(() => hoverBtn = false),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        transform: hoverBtn
                            ? (Matrix4.identity()..scale(1.05))
                            : Matrix4.identity(),
                        curve: Curves.easeInOut,
                        child: SizedBox(
                          width: double.infinity,
                          height: height * 0.065,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: hoverBtn
                                  ? Colors.deepPurpleAccent
                                  : const Color(0xFF3F51B5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: _updatePassword,
                            child: const Text(
                              "Update Password",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hint,
    required bool showPass,
    required VoidCallback onToggle,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      obscureText: !showPass,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white70),
        suffixIcon: IconButton(
          icon: Icon(
            showPass ? Icons.visibility : Icons.visibility_off,
            color: Colors.white70,
          ),
          onPressed: onToggle,
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
