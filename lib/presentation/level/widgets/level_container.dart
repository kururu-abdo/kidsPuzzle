import 'package:flutter/material.dart';

class LevelContainer extends StatelessWidget {
  final String?  label;
  final VoidCallback?  onTap;
final LinearGradient? linearGradient;
   LevelContainer({Key? key, this.label, this.onTap, this.linearGradient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 250,
        height: 50,
margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient:linearGradient
        ),
   child: Center(child: Text(label!,
   
   
   
   style: TextStyle(
      //  shadows: <Shadow>[
      //   Shadow(
      //     offset: Offset(10.0, 10.0),
      //     blurRadius: 3.0,
      //     color: Color.fromARGB(255, 0, 0, 0),
      //   ),
      //   Shadow(
      //     offset: Offset(10.0, 10.0),
      //     blurRadius: 8.0,
      //     color: Colors.grey,
      //   ),
      // ],
       foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.5
            ..color = Colors.white,
       
      //  color: Colors.white,
       fontWeight: FontWeight.bold ,fontSize: 25),),),
      ),
    );
  }
}