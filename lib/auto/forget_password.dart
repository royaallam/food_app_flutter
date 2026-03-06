import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(home: VerificationScreen()));

class VerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // الجزء العلوي أسود
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
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: CustomKeypad(),
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
}

// كود لوحة المفاتيح المخصصة في الأسفل
class CustomKeypad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.8,
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        if (index == 9) return SizedBox(); // فراغ يسار الصفر
        if (index == 10) return _buildKey('0');
        if (index == 11) return _buildKey('backspace', isIcon: true);
        return _buildKey('${index + 1}');
      },
    );
  }

  Widget _buildKey(String label, {bool isIcon = false}) {
    return Center(
      child: isIcon 
        ? Icon(Icons.backspace_outlined, color: Colors.black)
        : Text(label, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
    );
  }
}