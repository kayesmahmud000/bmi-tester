import 'package:bmi_test_app/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class BmiTestField extends StatefulWidget{
  final Function(Color) onBgChange;

  const BmiTestField({super.key,  required this.onBgChange});


@override
  State<BmiTestField> createState ()=> _BmiTestFieldState();
}

class _BmiTestFieldState extends State<BmiTestField>{
  var wtController =TextEditingController();
  var inController = TextEditingController();
  var ftController = TextEditingController();

  String result ='';


void calculateBIM(){
  var wt= wtController.text.toString();
  var ft = ftController.text.toString();
  var inc = inController.text.toString();


  if(wt !=''&& ft !='' && inc !='' ){
    var intWt= int.parse(wt);
    var intFt =int.parse(ft);
    var intInc = int.parse(inc);

   int totalHt = (intFt*12)+ intInc;
   print(totalHt);

  double totalCmHt = totalHt* 2.54;

  double totalMHt =totalCmHt/100;

  double bmi =intWt/(totalMHt*totalMHt);

setState(() {
  
  if(bmi>25){
    result = "You're Overweight! your BMI is : ${bmi.toStringAsFixed(2)}";
    widget.onBgChange(Colors.amber.shade100);
    
  }else if (bmi<18){
    result = "You're Underweight! your BMI is : ${bmi.toStringAsFixed(2)}";
    widget.onBgChange(Colors.red.shade100);
  }else{
    result ="You're Healthy! your BMI is : ${bmi.toStringAsFixed(2)}";
    widget.onBgChange(Colors.green.shade400);
  }
});


   
     }else{
setState(() {
   result ="Please fill the all inputs";
});
  }
}
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Column(
        mainAxisAlignment: .center,
        children: [
          TextField(
            controller:wtController ,
            decoration: InputDecoration(
              label: Text('Enter Your Weight'),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.line_weight_sharp)
            ),
          ),
          SizedBox(height: 11,),

          TextField(
            controller: ftController,
            decoration: InputDecoration(
              label: Text('Enter Your Height in Fit'),
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(Icons.height)
            ),
          ),
          SizedBox(height: 11,),
          TextField(
            controller: inController,
            decoration: InputDecoration(
              label: Text('Enter Your Height in Inch'),
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(Icons.height)
            ),
          ),

          SizedBox(height: 20,),
          CustomBtn( btnName: "Calculate",bgColor: Colors.green, textStyle: TextStyle(color:Colors.white, fontSize: 18) ,icon: Icon(Icons.calculate, color: Colors.white70,), callback: calculateBIM,),
          SizedBox(height: 11,),
          Text('$result' ,style: TextStyle(fontStyle: .italic, fontFamily: "MainFont", fontSize: 20 ),)
        ],
      ),
    );

  }
}