import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

import 'package:get/get.dart';
import 'package:kids_puzzle/domain/core/widgets/number_container.dart';
import 'package:kids_puzzle/generated/locales.g.dart';
import 'package:kids_puzzle/presentation/utils/packages/drag_and_drop/devDrag.dart';
import 'package:kids_puzzle/presentation/widgets/header.dart';

import 'controllers/level_tow.controller.dart';

class LevelTowScreen extends GetView<LevelTowController> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
   
      body: Column(
        
            children: [
GetBuilder<LevelTowController>(
 builder:  (ctrl) {
    return     Header(
      onRefresh: ()async{
await ctrl.refreshGame();
      },
      triesWidget:   Center(
            child: Column(
              children: [
                Text(LocaleKeys.tries.tr) ,
                Text(ctrl.tries.value.toString())
              ],
            ),
          ) ,

          timeWidget: Column(
  // mainAxisSize: MainAxisSize.min,
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(LocaleKeys.time.tr) ,
GetBuilder<LevelTowController>(
 builder:  (levelController)=>  Countdown(
            countdownController: levelController.countdownController!,
            builder: (_, Duration time) {
              return Text(
                '0${time.inHours}:0${time.inMinutes % 60}:${time.inSeconds % 60}',
            
              );
            })

),              ],
            ),
    );
  }
),
// SizedBox(height: 150,),
   Expanded(child: Obx(
     () =>


DragAndDropGridView(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        //childAspectRatio: 3 / 4.5,
    ),
    padding: EdgeInsets.all(0),
    itemBuilder: (context, index) => 
    NumberContainer(model: controller.numbers[index], height: 40,width: 40,
    
    fontSize: 18,
    
    )
		,
   
    itemCount: controller.numbers.length,
    onWillAccept: (oldIndex, newIndex) {
		// Implement you own logic

		// Example reject the reorder if the moving item's destination value is cat"
		if (controller.numbers[newIndex] == controller.numbers[oldIndex]){
			return false;
		}
		return true;// If you want to accept the child return true or else return false
	},
  
    isCustomChildWhenDragging: true,
childWhenDragging:(i)=>
Container(),

//childWhenDragging:(i)=> NumberContainer(model: controller.numbers[i] ,color: Colors.green,) ,
feedback:(i)=> Material(child: NumberContainer(model: controller.numbers[i] ,color: Colors.red,
height: 80 , width: 80,
    fontSize: 18,
)),
isCustomFeedback: true,
// /isCustomChildWhenDragging: true,
    onReorder: (oldIndex, newIndex) async{
	   await controller.swapping(oldIndex, newIndex);

    },

   )
//)

//         GridView.count(crossAxisCount: 3, 
       
//        children: 
       
       
       
//        controller.numbers.map((number) {
       
//          return
         
//                    Draggable<NumberModel>(
//               feedback: Opacity(
//                     opacity: 0.6,
// child:  NumberContainer(model: number,),

//               ),
//              data: number,
//              child: DragTarget(


//            onWillAccept: ( model){
//               if (model as NumberModel == number) {
//     return false;
//   }
//   return true;
//            },
//                 onAccept: (NumberModel value) { 
// print(value.number);
// controller.swapping(number, value);
//                 },
                
//              builder: (_, candidateData, rejectedData){

// return NumberContainer(model: number,);
//              }
             
//              )
//              );
         
         
//           DragTarget(


//            onWillAccept: ( model){
//               if (model as NumberModel == number) {
//     return false;
//   }
//   return true;
//            },
//                 onAccept: (NumberModel value) { 
// print(value.number);
// controller.swapping(number, value);
//                 },
                
//              builder: (_, candidateData, rejectedData) => 
//              Draggable<NumberModel>(
//               feedback: Opacity(
//                     opacity: 0.6,
// child:  NumberContainer(model: number,),

//               ),
//              data: number,
//              child: NumberContainer(model: number,)
             
             
//              ),
//          );
         
         
//          Text(number.toString());
//        }).toList(),
       
       
//         )
  )
   )

            ],
          )
        
    );

  }
}
