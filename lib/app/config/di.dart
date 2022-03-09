import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kids_puzzle/presentation/controllers/language_controller.dart';
import 'package:kids_puzzle/presentation/controllers/localization_controller.dart';
import 'package:kids_puzzle/presentation/controllers/theme_controller.dart';

init() async {
  // Core
  final getStorage =  GetStorage();
  Get.put( GetStorage());

  // Repository
  // Get.lazyPut(() => SplashRepo(sharedPreferences: Get.find(), apiClient: Get.find()));
  // Get.lazyPut(() => LanguageRepo());
  // Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  // Get.lazyPut(() => OrderRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  // Get.lazyPut(() => NotificationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  // Controller
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.put(GetStorage())));
  //Get.lazyPut(() => SplashController(splashRepo: Get.find()));
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.put(GetStorage())));
  Get.lazyPut(() => LanguageController(sharedPreferences: Get.put(GetStorage())));
  // Get.lazyPut(() => AuthController(authRepo: Get.find()));
  // Get.lazyPut(() => OrderController(orderRepo: Get.find()));
  // Get.lazyPut(() => NotificationController(notificationRepo: Get.find()));


}