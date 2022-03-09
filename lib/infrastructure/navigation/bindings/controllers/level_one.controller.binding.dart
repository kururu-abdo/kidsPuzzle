import 'package:get/get.dart';

import '../../../../presentation/levelOne/controllers/level_one.controller.dart';

class LevelOneControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LevelOneController>(
      () => LevelOneController(),
    );
  }
}
