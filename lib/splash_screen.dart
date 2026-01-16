import 'dart:async';

import 'package:bmi_test_app/main.dart';
import 'package:flutter/material.dart';

class SplashScreen  extends StatefulWidget{
  

SplashScreen();

@override
State<SplashScreen> createState ()=> _SplashScreenState();

}

class _SplashScreenState  extends State<SplashScreen>{

@override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 2), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>MyHomePage(title: "BMI TESTER") ,)));
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Container(
      color: Colors.green.shade200,
      child: Center(
        child: Row(
          mainAxisAlignment: .center,
          children: [
            Icon(Icons.rocket_launch , color: Colors.red.shade400, size: 30,),
            Text('BMI TESTER', style: Theme.of(context).textTheme.headlineMedium,),
          ],
        ),
      ),
    ),
   );
  }
}