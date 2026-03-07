import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:food_aap/onbarding/onboarding.dart'; // سنحتاجه لعمليات الدوران

void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App Splash',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false, // لإخفاء شريط التصحيح
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  
  // التحكم في الحركة
  late AnimationController _fanController;

  @override
  void initState() {
    super.initState();
    
    // إعداد وحدة التحكم بالحركة: دوران لا نهائي
    _fanController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
       // سرعة دوران هادئة
    )..repeat(); 
    // التكرار بلا نهاية
    Timer(Duration(seconds:4), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Onboarding()));
    });
  }

  @override
  void dispose() {
    // مهم جداً لإيقاف الحركة وتوفير الذاكرة
    _fanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // لملء الشاشة بالكامل
        children: [
          // 1. عنصر الخلفية (اللون البيج الفاتح والزخرفة الدائرية)
          // تأكد من إضافة الصورة إلى assets
          Image.asset(
            'images/1.png',
            fit: BoxFit.cover, // لملء الشاشة مع الحفاظ على الأبعاد
          ),

          // 2. الشعار في المنتصف
          // تأكد من إضافة صورة الشعار إلى assets
          

          // 3. المروحة البرتقالية المتحركة في الزاوية
          // تأكد من إضافة صورة المروحة إلى assets
          Positioned(
            right: -100, // إزاحة سالبة للخارج قليلاً لتظهر الزاوية فقط
            bottom: -100, // إزاحة سالبة للخارج قليلاً
            child: AnimatedBuilder(
              animation: _fanController,
              builder: (context, child) {
                // دوران المروحة حول نقطة محورية
                return Transform.rotate(
                  // الزاوية تساوي قيمة الحركة مضروبة في 2π لعمل دورة كاملة
                  angle: _fanController.value * 2.0 * math.pi,
                  child: child,
                );
              },
              // الصورة التي نريد تحريكها (تحميلها مرة واحدة خارج builder)
              child: 
              Image.asset(
                'images/fan_blades.jpeg',
                width: 350, // حجم كبير للمروحة لتغطية مساحة خلفية
                height: 350,
                
              ),
              
            ),
          ),
        ],
      ),
    );
  }
}