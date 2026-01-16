import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String btnName;
  final Color? bgColor;
  final Icon? icon;
  final VoidCallback? callback;
  final TextStyle? textStyle;

  const CustomBtn({super.key, required this.btnName, this.bgColor, this.icon, this.textStyle, this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: ElevatedButton(onPressed: ()=>callback!(), child: icon != null ?Row(
          mainAxisAlignment: .center,
          children: [
            icon!,
            SizedBox(width: 11),
            Text(btnName, style: textStyle,),
          ],
        ): Text(btnName ,style: textStyle,),
        
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          textStyle: textStyle,
          shape:RoundedRectangleBorder(
            borderRadius: .circular(2)
          )
        ),
        ),
      ),
    );

}
}