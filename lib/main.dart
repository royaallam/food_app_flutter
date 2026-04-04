import 'package:flutter/material.dart';
import 'package:food_aap/auto/widget_contet/containt_recet_search.dart';
import 'package:food_aap/auto/widget_contet/containt_six.dart';


import 'package:food_aap/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:SplashScreen(),
    );
  }
}

