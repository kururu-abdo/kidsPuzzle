    import 'dart:developer';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
 AudioCache audioCache = AudioCache(prefix: 'assets/sounds/' , duckAudio: true);
       playLocal(String path) async {
  //  final file = await audioCache.loadAsFile(path);
  //             final bytes = await file.readAsBytes();
  //               await  audioCache.playBytes(bytes, loop: false);

    // final file = await audioCache.loadAsFile(path);
    //           final bytes = await file.readAsBytes();
    //           audioCache.playBytes(bytes, loop: true);
    
try {
  

   await  audioCache.play(path, mode: PlayerMode.LOW_LATENCY);

} catch (e) {
  print(e.toString());
}
  }