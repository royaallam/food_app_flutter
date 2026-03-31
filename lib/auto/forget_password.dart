import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1D21), 
      body: Column(
        children: [
         
          Container(
            padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                SizedBox(height: 30),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Forgot Password",
                        style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Please sign in to your existing account",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          
          Expanded(
            child: Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white, 
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("EMAIL", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "example@gmail.com",
                      hintStyle: TextStyle(color: Colors.black26),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300)),
                    ),
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                       
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFF7A45), // لون الزر البرتقالي
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text("SEND CODE", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}