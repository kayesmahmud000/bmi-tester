import 'package:flutter/material.dart';

class ThreeDList extends StatelessWidget {
   ThreeDList({super.key});


  var arrList = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Center(child: Text("3D List", style: Theme.of(context).textTheme.headlineLarge,)),
      
      ),
      body: ListWheelScrollView(
        itemExtent: 100,
       children: arrList.map((value)=>Container(
        width: double.infinity,
        color: Colors.red,
       )).toList()

      ),
    );
  }
}