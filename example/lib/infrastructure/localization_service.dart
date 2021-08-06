import 'dart:ui';

import 'package:q_ratio/generated/locales.g.dart';
import 'package:get/get.dart';

class LocalizationService extends Translations {
  Map<String, String> enUS;

  static final fallbackLocale = locales[0];

  static final locales = [
    Locale('en', 'US'),
  ];

  LocalizationService() {
    enUS = {};
    enUS.addAll(Locales.en_US);
  }

  @override
  Map<String, Map<String, String>> get keys => {'en_US': enUS};

  static void changeLocale(Locale locale) {
    Get.updateLocale(locale);
  }
}
