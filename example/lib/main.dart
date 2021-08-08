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
}
