import 'package:bmi_test_app/splash_screen.dart';
import 'package:bmi_test_app/three_d_list.dart';
import 'package:bmi_test_app/widgets/bmi_test_field.dart';
import 'package:bmi_test_app/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI TEST',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.green),
        textTheme: TextTheme(headlineLarge: TextStyle(fontSize: 30, fontWeight: .bold, color: Colors.red.shade400 ,fontStyle: .italic , fontFamily:'MainFont'))
      ),
      // home: const MyHomePage(title: 'BMI TEST '),
      home:  SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Color bgColor = Colors.greenAccent.shade100;
 
 void bgChange( Color color){
  setState(() {
    bgColor =color;
  });
  
 }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Center(child: Text(widget.title, style: Theme.of(context).textTheme.headlineLarge,)),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color:bgColor,
          child:Column(
            mainAxisAlignment: .center,
            children: [
              Center(
                child: BmiTestField(onBgChange: bgChange),
              ),
              CustomBtn(btnName: 'Next Page', callback: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>ThreeDList())),)
            ],
          )
      ) 
      )  
    );
  }
}
