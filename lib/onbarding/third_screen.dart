import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
Image.asset("images/2_dev.png",height: 250,width: 500,
),
Text("Free delivery offers",style: TextStyle(
  color: Colors.amber,
  fontSize: 14

),),
Text("Get all your loved foods in one once place,\n you just place the orer do the rest",textAlign: TextAlign.center
,style: TextStyle(
  
  color: Colors.amber,
  fontSize: 20,
  fontWeight: FontWeight.bold
),),
      ],
    );
  }
}