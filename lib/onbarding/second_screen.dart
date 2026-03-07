import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
Image.asset("images/3_chef.png",height: 250,width: 500,),
SizedBox(height: 20,),
Text("Order from chef",style: TextStyle(
  color: Colors.deepOrange,
  fontSize: 20

),),
SizedBox(height: 20,),
Text("Get all your loved foods in one once place,\n you just place the orer do the rest",textAlign: TextAlign.center
,style: TextStyle(
  
  color: Colors.deepOrange,
  fontSize: 18,
  fontWeight: FontWeight.bold
),),
      ],
    );
  }
}