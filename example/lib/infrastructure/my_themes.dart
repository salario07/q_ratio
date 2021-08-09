import 'package:example/styles/my_style_data.dart';
import 'package:flutter/material.dart';
import 'package:taav_ui/taav_ui.dart';

import 'my_base_theme.dart';

class MyThemes {
  static const Color primaryColor = Colors.deepOrange;
  static final Color secondaryColor = Colors.lightBlue;
  static const Color accentColor = Colors.blueAccent;
  static final Color successColor = TaavColors.green.shade500;
  static final Color infoColor = TaavColors.teal;
  static final Color warningColor = Color(0xFFffc107);
  static final Color dangerColor = TaavColors.red[600];
  static final Color disabledColor = TaavColors.grey[400];

  // todo selected background
  static final Color selectedColor = Colors.blueGrey.shade50;
  static const String fontFamilyPrimary = 'IRANSans';
  static const String fontFamilySecondary = 'IRANSans';
  static const double borderRadiusRectangle = 2.0;
  static const double borderRadiusRound = 2000.0;
  static const double borderRadiusSemiRound = 10.0;
  static final defaultLightTheme = StyleData({})
    ..inject(MyBaseTheme.toStyle(
      themeName: 'themeBase',
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      accentColor: accentColor,
      successColor: successColor,
      infoColor: infoColor,
      warningColor: warningColor,
      dangerColor: dangerColor,
      disabledColor: disabledColor,
      selectedColor: selectedColor,
      fontFamilyPrimary: fontFamilyPrimary,
      fontFamilySecondary: fontFamilySecondary,
      borderRadiusRectangle: borderRadiusRectangle,
      borderRadiusRound: borderRadiusRound,
      borderRadiusSemiRound: borderRadiusSemiRound,
    ))
    ..inject(scaffoldStyles)
    ..inject(MyStyleData.textStyles)
    ..inject(buttonStyles)
    ..inject(MyStyleData.iconButtonStyle)
    ..inject(MyStyleData.textFormFieldStyles)
    ..inject(MyStyleData.radioStyles)
    ..inject(checkboxStyles)
    ..inject(dropdownStyles)
    ..inject(dividerStyles)
    ..inject(chipStyles)
    ..inject(badgeStyles)
    ..inject(dialogStyles)
    ..inject(MyStyleData.switchStyles);
}
