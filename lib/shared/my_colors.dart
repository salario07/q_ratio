import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taav_ui/taav_ui.dart';

class MyColors {
  static const String themeName = 'themeBase';

  static Color get successColor {
    StyleData style = TaavThemeEngine.of(Get.context);
    return style.get('$themeName-successColor');
  }

  static Color get primaryColor {
    StyleData style = TaavThemeEngine.of(Get.context);
    return style.get('$themeName-primaryColor');
  }

  static Color get secondaryColor {
    StyleData style = TaavThemeEngine.of(Get.context);
    return style.get('$themeName-secondaryColor');
  }

  static Color get accentColor {
    StyleData style = TaavThemeEngine.of(Get.context);
    return style.get('$themeName-accentColor');
  }

  static Color get infoColor {
    StyleData style = TaavThemeEngine.of(Get.context);
    return style.get('$themeName-infoColor');
  }

  static Color get warningColor {
    StyleData style = TaavThemeEngine.of(Get.context);
    return style.get('$themeName-warningColor');
  }

  static Color get dangerColor {
    StyleData style = TaavThemeEngine.of(Get.context);
    return style.get('$themeName-dangerColor');
  }

  static Color get disabledColor {
    StyleData style = TaavThemeEngine.of(Get.context);
    return style.get('$themeName-disabledColor');
  }

  static Color get selectedColor {
    StyleData style = TaavThemeEngine.of(Get.context);
    return style.get('$themeName-selectedColor');
  }

  static Color get backgroundColor {
    return Color.fromARGB(255, 241, 241, 241);
  }

  static Color get dividerColor {
    return Color.fromARGB(255, 232, 232, 232);
  }
}
