import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kids_puzzle/presentation/controllers/language_controller.dart';
import 'package:kids_puzzle/presentation/controllers/localization_controller.dart';
import 'package:kids_puzzle/presentation/controllers/theme_controller.dart';

class Header extends StatefulWidget {
  final Widget? triesWidget;
    final Widget? timeWidget;
final VoidCallback? onRefresh;
  Header({Key? key, this.triesWidget, this.timeWidget, this.onRefresh}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {

var themeController = Get.find<ThemeController>();

var localeController = Get.find<LocalizationController>();


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(mainAxisSize: MainAxisSize.min,
              children: [
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




 widget.timeWidget !,



            ],
          ) ,

        Row(
          mainAxisAlignment:MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            widget.triesWidget! ,
SizedBox(width: 50,),
            IconButton(onPressed:widget.onRefresh, icon: Icon(Icons.refresh))
          ],
        )


        ],
      ),
    );
  }
}