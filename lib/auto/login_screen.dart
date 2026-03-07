import 'package:flutter/material.dart';
import 'package:food_aap/auto/forget_password.dart';
import 'package:food_aap/auto/sing_up_screen.dart';
import 'package:food_aap/auto/verification_screen%20.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E), // لون الخلفية العلوية الداكنة
      body: Stack(
        children: [
          // القسم العلوي: العنوان
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Column(
              children: const [
                Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Please sign in to your existing account',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),

          // القسم السفلي: نموذج تسجيل الدخول
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('EMAIL', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                    const TextField(
                      decoration: InputDecoration(hintText: 'example@gmail.com'),
                    ),
                    const SizedBox(height: 30),
                    const Text('PASSWORD', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.visibility_outlined),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(value: false, onChanged: (val) {}),
                            const Text('Remember me'),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                           Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>ForgetPassword()));
                          },
                          child: const Text('Forgot Password', style: TextStyle(color: Colors.orange)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE67E5D), // اللون البرتقالي
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>VerificationScreen()));
                        },
                        child: const Text('LOG IN', style: TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? "),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>SignUpScreen()));
                            },
                            child: const Text('SIGN UP', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                    const Center(child: Text('Or', style: TextStyle(color: Colors.grey))),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _socialIcon(Icons.facebook, Colors.blue[900]!),
                        const SizedBox(width: 20),
                        _socialIcon(Icons.alternate_email, Colors.lightBlue),
                        const SizedBox(width: 20),
                        _socialIcon(Icons.apple, Colors.black),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget مساعد للأيقونات الاجتماعية
  Widget _socialIcon(IconData icon, Color color) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: color.withOpacity(0.1),
      child: Icon(icon, color: color, size: 30),
    );
  }
}