import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key, required this.text,this.onTap});
  final String text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap
      ,child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(11)
        ),
        width: double.infinity,
        height:60 ,
        child: Center(child: Text(text,
        style: const TextStyle(color: Colors.white),
        )),
      ),);
  }
}