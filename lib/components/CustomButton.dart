import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  final IconData icon;
  final String action;
  final VoidCallback  onpressed;
  final Color color;
  CustomButton({required this.icon, required this.action, required this.onpressed, required this.color,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: MaterialButton(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.symmetric(horizontal: 5),
        onPressed: onpressed,
        color: color,
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 8,),
            Text(action),
          ],
        ),),
    );
  }

}