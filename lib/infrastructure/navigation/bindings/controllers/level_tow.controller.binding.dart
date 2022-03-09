import 'package:get/get.dart';

import '../../../../presentation/levelTow/controllers/level_tow.controller.dart';

class LevelTowControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LevelTowController>(
      () => LevelTowController(),
    );
  }
}
