import 'package:flutter/material.dart';
import 'package:kids_puzzle/domain/core/model/number_model.dart';

class NumberContainer extends StatelessWidget {
       final int? model;
   final Color?  color;
   final double? width;
      final double? height;
final double? fontSize;
     NumberContainer({Key? key, this.model, this.color=Colors.red, this.width=80, this.height=80, this.fontSize=25}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.all(5),
    
      decoration: BoxDecoration(
        color: color ,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: Text(model!.toString() , style: TextStyle(fontWeight: 
      FontWeight.bold ,fontSize: fontSize, color: Colors.white),),),
    );
  }
}