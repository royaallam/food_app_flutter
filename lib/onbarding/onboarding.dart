import 'package:flutter/material.dart';
import '../onbarding/first_screen.dart';
import '../onbarding/second_screen.dart';
import '../onbarding/third_screen.dart';


class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController _controller=PageController();
  int index=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(
      children: [
        Expanded(
          child: PageView(
            controller: _controller,
           children: [
            FirstScreen(),
            SecondScreen(),
            ThirdScreen(),
           ],
          ),
        ),
        Row(children: [
          Column(
            
          )
        ],)
      ],
    ));
  }
}