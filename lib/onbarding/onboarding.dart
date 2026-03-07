import 'package:flutter/material.dart';
import 'package:food_aap/auto/login_screen.dart';
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
        InkWell(
         
           child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              
              borderRadius: BorderRadius.circular(20)
              ,
            ),
            child: Center(child: Text(index==2?"":"Skip"))),
           
           ),
           InkWell(
            onTap: () {
              if(index==2){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>LoginPage())
               
  
                
                );
              }else{
               _controller.animateToPage(index+1, duration: Duration(
            milliseconds: 250
          ), curve: Curves.linear); 
              }
             
            },
            child:Container(
              height: 50,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20)
              ,
            ),
              child: Center(
                child: Text(
                        index==2?"GET STARTED":
                        "Next",style: TextStyle(color: Colors.white),),
              ),
            ) ,
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
      borderRadius: BorderRadius.circular(20),
      color: active?Colors.amber:Colors.deepOrangeAccent,
    ),
    width:active?30:10 ,
    height: 10,
    );

  }
}