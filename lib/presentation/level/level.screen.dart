
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kids_puzzle/generated/locales.g.dart';
import 'package:kids_puzzle/infrastructure/navigation/routes.dart';
import 'package:kids_puzzle/presentation/controllers/localization_controller.dart';
import 'package:kids_puzzle/presentation/controllers/theme_controller.dart';
import 'package:kids_puzzle/presentation/level/widgets/level_container.dart';

import 'controllers/level.controller.dart';

class LevelScreen extends GetView<LevelController> {
  var themeController = Get.find<ThemeController>();

var localeController = Get.find<LocalizationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
  GetBuilder<LocalizationController>(
                  builder: (locale) {
                    return IconButton(onPressed: (){
if (locale.locale.languageCode=="en") {
  locale.setLanguage(Locale("ar"));
} else {
  locale.setLanguage(Locale("en"));
}

                    }, icon:
                    Image.asset(locale.locale.languageCode=="ar"?"assets/images/ksa.png"
:"assets/images/uk.png"
 ),
                    
//                     ImageIcon(AssetImage(
// locale.locale.languageCode=="ar"?"assets/images/ksa.png"
// :"assets/images/uk.png"
 
//                     ) ,
                    
//                          color: Color(0xFF3A5A98),
                    
//                     )
                    
                    );
                  }
                ) ,




 GetBuilder<ThemeController>(
   builder: (theme) {
     return IconButton(
                  icon: Icon(theme.darkTheme
                      ? Icons.dark_mode
                      : Icons.light_mode),
                  onPressed: () {
                    theme.toggleTheme();
                  });
   }
 )   


        ],
      ),
    // backgroundColor: Colors.white70,
      body: Column(children: [
SizedBox(height: 120,),
Center(child: Text(LocaleKeys.choose_level_txt.tr , style: TextStyle(fontWeight: FontWeight.w700 , fontSize: 22),),

),
SizedBox(height: MediaQuery.of(context).size.height/4 -100) ,

LevelContainer(
  label: LocaleKeys.level_one_txt.tr,
  linearGradient: LinearGradient(colors: [Color(0xFFb0e458) ,Color(0xFFb0e458)]),
  onTap: (){
    Get.toNamed(Routes.LEVEL_ONE);
  },
)

,
LevelContainer(
  label: LocaleKeys.level_two_txt.tr,
   linearGradient: LinearGradient(
     begin: Alignment.topCenter,
     end: Alignment.bottomCenter,
     stops: [0.4 ,0.6],
     colors: [Color(0xFF746d32) , Color(0xFF4d2c2c)]),
  onTap: (){
    Get.toNamed(Routes.LEVEL_TOW);
  },
),
LevelContainer(
  label: LocaleKeys.level_three_txt.tr,
  
  linearGradient: LinearGradient(
     begin: Alignment.topCenter,
     end: Alignment.bottomCenter,
    stops: [0.3, 0.7],
    colors: [Color(0xFF52282d) ,Color(0xFF2e2e29)]),
  onTap: (){
        Get.toNamed(Routes.LEVEL_THREE);
  },
)



      ],)
      




    );
  }
}
