import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kids_puzzle/presentation/utils/helpers.dart';
import 'package:kids_puzzle/presentation/widgets/lose_alert.dart';
import 'package:kids_puzzle/presentation/widgets/win_alert.dart';

class LevelTowController extends GetxController {
RxList<int>  numbers = 
  <int>[].obs;
// var time =(DateTime.now().millisecondsSinceEpoch + 1000 * 90).obs;
  CountdownTimerController? controller;
   CountdownController? countdownController; 
  RxList<int>  sortedNumbers = 
  <int>[].obs;
   Set<int> setOfInts = Set();

  final count = 0.obs;
  final tries =0.obs;





  
  @override
  void onInit() {
    super.onInit();
   
   
   countdownController =
      CountdownController(duration: Duration(seconds: 150),
      onEnd: () async{
         if (!checkIfisSorted()) {
     tries.value=0;
     update();
    await  playLocal('wrong.mp3');
    Get.dialog(LoseDialog(
      okButtnClicked: (){
        Get.back();
refreshGame();
      },
    ) ,
    
        barrierDismissible: false

    
    );
   }
      }
      );
   
    fillArray();
        countdownController!.start();
     player = AudioPlayer();
 
    // sortedNumbers =numbers;
    // sortedNumbers.sort();
  }
   refreshGame(){
  //   time.value =(DateTime.now().millisecondsSinceEpoch + 1000 * 90);
          //controller = CountdownTimerController(endTime:  DateTime.now().millisecondsSinceEpoch + 1000 * 90, onEnd: onEnd());

     tries.value=0;
     update();
     //clearing array
     numbers.value=[];
     //clearing sorted array
     sortedNumbers.value=[];
     //clear set
     setOfInts= Set();
     fillArray();
   countdownController!.value = Duration(seconds: 150).inMilliseconds;
   countdownController!.start();

   }
  fillArray() {
  while (setOfInts.length <=14) {
    setOfInts.add(getNumber());
  }




  for (var i =0;i<setOfInts.length;i++) {
    //numbers.add(NumberModel(idx:i , number:setOfInts.elementAt(i)));

        numbers.add(setOfInts.elementAt(i));

  }





for (var item in numbers) {
  sortedNumbers.add(item);
}
sortedNumbers.sort();
  }
late AudioPlayer player;
  int getNumber() {
   var random = new Random();
 
    int min = 21;
 
    int max = 99;
 
    int result = min + random.nextInt(max - min);
    return result;
  }
  @override
  void onReady() {
    super.onReady();



     
  }


 void onEnd()async{
   tries.value =0;
   update();
   //
countdownController!.stop();
   if (!checkIfisSorted()) {
     tries.value=0;

    await  playLocal('wrong.mp3');
    Get.dialog(LoseDialog(
      okButtnClicked: (){
        Get.back();
refreshGame();
      },
    ) ,
    
        barrierDismissible: false

    
    );
   }
 }


  swapping(int n1 ,int n2)async{
/*
int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

void onEnd() {
  print('onEnd');
}

...
CountdownTimer(
  endTime: endTime,
  onEnd: onEnd,
),



*/


print('inside');

numbers.swap(n1,n2);
 tries.value =  tries.value+ 1;
    update();
 await playLocal('flip.mp3');
checkForWin();
  }
checkIfisSorted(){

  
  
Function eq = const IterableEquality().equals;
return  eq(numbers, sortedNumbers);


  

}
checkForWin() async{
  if (checkIfisSorted()) {
await  playLocal("right.mp3");

    Get.dialog(
      
      WinDialog(okButtnClicked: (){
         Get.back();
refreshGame();
    },) ,
    
    barrierDismissible: false
    
    );
  }
}

// playSound()async{
//   try {
//     print('audio');
//      await player.setAsset('audio/flip.mp3');
//  await player.play();
//   } catch (e) {
//     print(e.toString());
//   }
// }





  @override
  void onClose() { 
    
     player.dispose();
    //  controller!.dispose();

   

// if (!countdownController!.isRunning) {
//             countdownController!.start();
// //            countdownController!.dispose();
//           } else {
//             countdownController!.stop();
//   //          countdownController!.dispose();
//           }



     }
  void increment() => count.value++;
}
