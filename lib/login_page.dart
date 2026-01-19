import 'package:bmi_test_app/constent/kay.dart';
import 'package:bmi_test_app/main.dart';
import 'package:bmi_test_app/splash_screen.dart';
import 'package:bmi_test_app/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController =TextEditingController();
  var passController = TextEditingController();

@override
void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }


  void login() async{
   
    var email =emailController.text.toString();
    var pass = passController.text.toString();
    print('$email $pass');
    var sharedPref =await SharedPreferences.getInstance();
    sharedPref.setBool(StorageKey.keyLogin, true);

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: "BMI TESTER")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.green.shade100,
          width: double.infinity,
          height: double.infinity,
          child: Container(
            child: Column(
              mainAxisAlignment: .center,
              children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Icon(Icons.account_circle , color: Colors.green.shade300,size: 100,),
               ),
               Container(
                width: 300,
                 child: TextField(
                  keyboardType: TextInputType.text,
                  controller: emailController,
                   decoration: InputDecoration(
                label: Text('Enter Your Email'),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.email)
              ),
                 ),
               ),
               SizedBox(height: 10,),
               Container(
                width: 300,
                 child: TextField(
                  keyboardType: TextInputType.text,
                  controller: passController,
                   decoration: InputDecoration(
                label: Text('Enter Your Password'),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.lock)
              ),
                 ),
               ),
            
              Container(
                width: 300,
                child: CustomBtn(btnName: "Login" ,bgColor: Colors.blue ,textStyle:TextStyle(color: Colors.white, fontSize: 15), callback: () => login(), icon: Icon(Icons.login),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}