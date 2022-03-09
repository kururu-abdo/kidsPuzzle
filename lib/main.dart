import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kids_puzzle/app/services/storage_services.dart';
import 'package:kids_puzzle/app/util/app_constansts.dart';
import 'package:kids_puzzle/generated/locales.g.dart';
import 'package:kids_puzzle/infrastructure/theme/app_theme.dart';
import 'package:kids_puzzle/presentation/controllers/language_controller.dart';
import 'package:kids_puzzle/presentation/controllers/localization_controller.dart';
import 'package:kids_puzzle/presentation/controllers/theme_controller.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';
import 'package:kids_puzzle/app/config/di.dart' as di;
void main() async {
  var initialRoute = await Routes.initialRoute;
  await di.init();
  await initialConfig();

  final storage = Get.find<StorageService>();
  runApp(Main(initialRoute));
}
Future<void> initialConfig() async {
  await Get.putAsync(() => StorageService().init());
  // DBService, ...
}
class Main extends StatelessWidget {
  final String initialRoute;
  Main(this.initialRoute);
  final storage = Get.find<StorageService>();
  @override
  Widget build(BuildContext context) {







 return GetBuilder<ThemeController>(builder: (themeController) {
      return GetBuilder<LanguageController>(builder: (localizeController) {
      return GetBuilder<LocalizationController>(builder: (lang) {
        //  return (GetPlatform.isWeb && splashController.configModel == null)
              // ? SizedBox()
              // :
              
              
           return
               GetMaterialApp(
                  title: 'puzzle',
                  debugShowCheckedModeBanner: false,
                  navigatorKey: Get.key,
                  theme: themeController.darkTheme ? darkThemeData() : lightThemeData(),
                  locale: lang.locale,
                  translations: AppTranslation(),
                  fallbackLocale: Locale(AppConstants.languages[0].languageCode!,
                     ),
                  initialRoute: initialRoute,
                  getPages: Nav.routes
                  ,
                  defaultTransition: Transition.topLevel,
                  transitionDuration: Duration(milliseconds: 500),
                );
        });
      });
    });










    return
     GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      navigatorKey: Get.key,
      initialRoute: initialRoute,
      translations: AppTranslation(),
       locale: storage.languageCode != null
          ? Locale(storage.languageCode!)
          : Locale('ar', 'AR'), //should read locale from shared prefs
      fallbackLocale: const Locale('ar'),
      getPages: Nav.routes,
      themeMode: ThemeMode.dark,
      darkTheme: darkThemeData(),
      theme: lightThemeData(),
    );
  }
}
