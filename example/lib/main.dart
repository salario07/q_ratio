library mypackage;

import 'package:flutter/material.dart';
import 'package:example/infrastructure/localization_service.dart';
import 'package:get/get.dart';
import 'package:q_ratio/views/home_page.dart';
import 'package:taav_ui/taav_ui.dart';
import 'package:example/infrastructure/taav_theme_data.dart' as oldTheme;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Q Ratio',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      locale: LocalizationService.locales[0],
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      home: HomePage(),
      builder: (context, child) => TaavTheme(
          theme: TaavThemes.defaultLightTheme,
          child: Theme(
              data: oldTheme.TaavTheme(fontFamily: 'Tahoma').themeData,
              child: TaavToast(child: child))),
    );
  }

/*StyleData getTheme() {
    return StyleData({
      '${MyColors.themeName}-primaryColor': Colors.deepOrange,
      '${MyColors.themeName}-secondaryColor': Colors.deepPurple,
      '${MyColors.themeName}-accentColor': Colors.blue,
      '${MyColors.themeName}-successColor': Colors.green,
      '${MyColors.themeName}-infoColor': Colors.lightBlue,
      '${MyColors.themeName}-warningColor': Colors.orange,
      '${MyColors.themeName}-dangerColor': Colors.red,
      '${MyColors.themeName}-disabledColor': Colors.green,
      '${MyColors.themeName}-selectedColor': Colors.deepOrange,
      '${MyColors.themeName}-normalColor': Colors.deepOrange,
      '${MyColors.themeName}-fontFamilyPrimary': 'roboto',
      '${MyColors.themeName}-fontFamilySecondary': 'roboto',
      '${MyColors.themeName}-borderRadiusRectangle': 2.0,
      '${MyColors.themeName}-borderRadiusRound': 2000.0,
      '${MyColors.themeName}-borderRadiusSemiRound': 10.0,
    });
  }*/
}
