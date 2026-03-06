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
    return Scaffold(
      body: SafeArea(child: Column(
      children: [
        Expanded(
          child: PageView(
            onPageChanged: (value){
              setState(() {
                index=value;
              });
            },
            controller: _controller,
           children: [
            FirstScreen(),
            SecondScreen(),
            ThirdScreen(),
           ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIndicator(active: index==0),
            SizedBox(width: 5,),
            CustomIndicator(active: index==1),
            SizedBox(width: 5,),
            CustomIndicator(active: index==2),
        ],),
        ElevatedButton(onPressed: (){
          
        }, child: Text(index==2?"Register":"skip")),
      ElevatedButton(onPressed: (){
        _controller.animateToPage(index+1, duration: Duration(
            milliseconds: 250
          ), curve: Curves.linear);
      }, child: Text(
        index==2?"login":
        "next")
        )
      ],
    )),
    );
  }
}

class CustomIndicator extends StatelessWidget {
  final bool active;
  const CustomIndicator({super.key,required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration: Duration(milliseconds: 250),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: active?Colors.grey:Colors.amber,
    ),
    width:active?30:10 ,
    height: 10,
    );

  }
}