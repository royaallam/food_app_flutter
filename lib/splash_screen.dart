import 'package:flutter/material.dart';
import 'package:food_aap/onbarding/onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(child: Image.asset("images/1.png"),
          ),
          OutlinedButton(onPressed: (){
            Navigator.of(context).push<void>(
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const Onboarding(),
    ),
  );
          }, child: Text(">>>>"))
        ],
      ),
      

    );
  }
}