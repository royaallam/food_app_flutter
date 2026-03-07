import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
      Image.asset("images/4_fav.png",height: 250,width: 500,),
      SizedBox(height: 20,),
      Text("All your favorites",style: TextStyle(
       color: Colors.deepOrange,
        fontSize: 20

        ),),
      Container(
        margin: EdgeInsets.all(20),
        child: Text("Get all your loved foods in one once place,\n you just place the orer do the rest",textAlign: TextAlign.center
         ,style: TextStyle(
          
          color: Colors.deepOrange,
          fontSize: 18,
           fontWeight: FontWeight.bold
             ),),
      ),
      ],
    );
  }
}