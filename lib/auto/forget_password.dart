import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(home: VerificationScreen()));

class VerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // --- الجزء العلوي (العنوان والإيميل) ---
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                children: [
                  Text(
                    'Verification',
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'We have sent a code to your email\nexample@gmail.com',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),

            // --- الجزء الأبيض السفلي ---
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    // حقل إدخال الكود
                    
                    
                    SizedBox(height: 40),
                    
                    // زر التفعيل (Verify)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[800],
                          minimumSize: Size(double.infinity, 55),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        ),
                        child: Text('VERIFY', style: TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ),

                    Spacer(),

                    // --- لوحة المفاتيح المخصصة ---
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
