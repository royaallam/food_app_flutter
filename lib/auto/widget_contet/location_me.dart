import 'package:flutter/material.dart';
import 'package:food_aap/auto/widget_contet/containt_one.dart';

void main() {
  runApp(const MaterialApp(home: LocationAccessScreen()));
}

class LocationAccessScreen extends StatelessWidget {
  const LocationAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // لون خلفية هادئ قريب من الصورة
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // الجزء الخاص بالصورة (الخريطة والماركر)
              // يمكنك استبدال هذا بـ Image.asset إذا كانت لديك الصورة كملف
              Stack(
                alignment: Alignment.center,
                children: [
                   Icon(Icons.map_outlined, size: 200, color: Colors.yellow.shade700.withOpacity(0.5)),
                   const Icon(Icons.location_on, size: 100, color: Colors.red),
                ],
              ),
              
              const SizedBox(height: 50),

              // زر الوصول إلى الموقع
              ElevatedButton(
                onPressed: () {
                  // أضف هنا منطق طلب الإذن بالوصول للموقع
                  Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>ContaintOne()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF27E41), // اللون البرتقالي الموضح
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ACCESS LOCATION',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.location_searching, color: Colors.white, size: 20),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // النص السفلي
              const Text(
                'DFOOD WILL ACCESS YOUR LOCATION\nONLY WHILE USING THE APP',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}