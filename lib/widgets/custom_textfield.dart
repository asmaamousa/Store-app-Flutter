import 'package:flutter/material.dart';

class  CustomTextFeild extends StatelessWidget {
   CustomTextFeild({super.key,this.hintText,this.onChanged,this.inputType});
 String? hintText;
 Function(String)? onChanged;
 TextInputType? inputType;
 bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return  TextField(
//obscureText: obscureText!,
keyboardType: inputType,

onChanged: onChanged,
decoration: InputDecoration(hintText: hintText,

enabledBorder: OutlineInputBorder
(borderSide:const BorderSide(),
borderRadius:BorderRadius.circular(11)
),
border: OutlineInputBorder(
  borderSide: const BorderSide(),
  borderRadius:BorderRadius.circular(11)
)
),


    );
  }
}