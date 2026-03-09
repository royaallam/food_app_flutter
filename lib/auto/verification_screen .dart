import 'package:flutter/material.dart';
import 'package:food_aap/auto/widget_contet/location_me.dart';



class VerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 37, 84),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // ver
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

            // stack
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
                    SizedBox(height: 50),
                    Row(
                      
                      
                      children: [
                      
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        height: 40,
                        width: 50,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder()
                          ),
                        ),
                      ),
                      
                      Container(
                        
                        height: 40,
                        width: 50,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder()
                          ),
                        ),
                      ),
                      SizedBox(width: 30,),
                      Container(
                        
                        height: 40,
                        width: 50,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder()
                          ),
                        ),
                      ),
                      SizedBox(width: 30,),
                      Container(
                        
                        height: 40,
                        width: 50,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder()
                          ),
                        ),
                      ),
                    ],),
                    // حقل إدخال الكود
                    
                    
                    SizedBox(height: 40),
                    
                    // زر التفعيل (Verify)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>LocationAccessScreen()));
                        },
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

