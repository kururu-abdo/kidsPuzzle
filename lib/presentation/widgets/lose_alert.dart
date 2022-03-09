import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:kids_puzzle/generated/locales.g.dart';
import 'package:lottie/lottie.dart';

class LoseDialog extends StatefulWidget {
  final VoidCallback?  tryAgainButtonClick;
  final VoidCallback? okButtnClicked;
   LoseDialog({ Key? key, this.tryAgainButtonClick, this.okButtnClicked }) : super(key: key);

  @override
  _LoseDialogState createState() => _LoseDialogState();
}

class _LoseDialogState extends State<LoseDialog> with TickerProviderStateMixin {
    AnimationController? _controller;
 @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller!.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20.0)),


                    child: Container(
                      height: 300,
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
Lottie.asset(
  'assets/animations/win.json',
  width: 150,
  height: 150,
  fit: BoxFit.fill,
),
SizedBox(height: 20,),
Text(LocaleKeys.you_lost_txt.tr ,  style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w700),) ,
SizedBox(height: 30,),
InkWell(
  onTap: widget.okButtnClicked,
  child:   Container(height: 50,width: 150,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.amber
  ),
  child: 
     Center(child:  Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Text(LocaleKeys.try_again_txt.tr , style: TextStyle(fontWeight: FontWeight.w700),),
         Icon(Icons.refresh)
       ],
     ),)
     
  
  ),
)


                      ],
                    ),),

    );
  }
}