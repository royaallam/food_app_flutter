import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:food_aap/onbarding/onboarding.dart'; 

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
      debugShowCheckedModeBanner: false, 
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
  
  // ani
  late AnimationController _fanController;

  @override
  void initState() {
    super.initState();
    
   
    _fanController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
       
    )..repeat(); 
   
    Timer(Duration(seconds:4), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Onboarding()));
    });
  }

  @override
  void dispose() {
    // stop anim
    _fanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, 
        children: [
          
          Image.asset(
            'images/1.png',
            fit: BoxFit.cover, 
          ),

          
          Positioned(
            right: -100, 
            bottom: -100, 
            child: AnimatedBuilder(
              animation: _fanController,
              builder: (context, child) {
                
                return Transform.rotate(
                  
                  angle: _fanController.value * 2.0 * math.pi,
                  child: child,
                );
              },
              
              child: 
              Image.asset(
                'images/fan_blades.jpeg',
                width: 350, 
                height: 200,
                
              ),
              
            ),
          ),
        ],
      ),
    );
  }
}