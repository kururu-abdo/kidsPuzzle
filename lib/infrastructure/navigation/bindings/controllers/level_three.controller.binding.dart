import 'package:get/get.dart';

import '../../../../presentation/levelThree/controllers/level_three.controller.dart';

class LevelThreeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LevelThreeController>(
      () => LevelThreeController(),
    );
  }
}
