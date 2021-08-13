library mypackage;

import 'package:example/infrastructure/my_themes.dart';
import 'package:flutter/material.dart';
import 'package:example/infrastructure/localization_service.dart';
import 'package:get/get.dart';
import 'package:q_ratio/infrastructure/bindings/home_page_binding.dart';
import 'package:q_ratio/infrastructure/q_ratio_pages.dart';
import 'package:q_ratio/infrastructure/q_ratio_routes.dart';
import 'package:taav_ui/taav_ui.dart';
import 'package:example/infrastructure/taav_theme_data.dart' as oldTheme;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<GetPage> allPages = QRatioPages.pages;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Q Ratio',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      locale: LocalizationService.locales[0],
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      getPages: allPages,
      initialBinding: HomePageBinding(),
      initialRoute: QRatioRoutes.homePage,
      onUnknownRoute: (RouteSettings settings) {
        return _unknownPage(settings);
      },
      builder: (context, child) => TaavTheme(
          theme: MyThemes.defaultLightTheme,
          child: Theme(
              data: oldTheme.TaavTheme(fontFamily: 'Roboto').themeData,
              child: TaavToast(child: child))),
    );
  }

  MaterialPageRoute<void> _unknownPage(RouteSettings settings) {
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) =>
          Scaffold(body: Center(child: Text('Not Found'))),
    );
  }
}
