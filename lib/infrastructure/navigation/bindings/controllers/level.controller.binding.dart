import 'package:get/get.dart';

import '../../../../presentation/level/controllers/level.controller.dart';

class LevelControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LevelController>(
      () => LevelController(),
    );
  }
}
