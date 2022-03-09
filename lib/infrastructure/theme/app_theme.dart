import 'package:flutter/material.dart';

ThemeData lightThemeData() {
  return ThemeData(
      brightness: Brightness.light,
      fontFamily: 'URW DIN Arabic',
      scaffoldBackgroundColor: Colors.white70,
      // primaryColor: AppColors.scaffoldLightBackground,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      // primarySwatch: createMaterialColor(AppColors.primaryColor)
      );
}

// Dark theme data
ThemeData darkThemeData() {
  return ThemeData(
      brightness: Brightness.dark,
      
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'URW DIN Arabic',
      // primarySwatch: createMaterialColor(AppColors.primaryColor),
       scaffoldBackgroundColor: Color(0xFF000000)
      );
}