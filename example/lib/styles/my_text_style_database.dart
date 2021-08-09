import 'package:flutter/widgets.dart';
import 'package:taav_ui/taav_ui.dart';

class TaavTextStyleDataBase {
  TaavTextStyleDataBase._();
  static StyleData toStyle({
    @required String themeName,
    @required dynamic primaryColor,
    @required dynamic secondaryColor,
    @required dynamic successColor,
    @required dynamic infoColor,
    @required dynamic warningColor,
    @required dynamic dangerColor,
    @required dynamic disabledColor,
    @required dynamic contentColor,
  }) {
    assert(themeName != null && themeName.isNotEmpty);

    assert(primaryColor != null &&
        (primaryColor is Color || primaryColor is String) ||
        primaryColor is Color Function(StyleData));

    assert(secondaryColor != null &&
        (secondaryColor is Color || secondaryColor is String) ||
        secondaryColor is Color Function(StyleData));

    assert(successColor != null &&
        (successColor is Color || successColor is String) ||
        successColor is Color Function(StyleData));

    assert(infoColor != null && (infoColor is Color || infoColor is String) ||
        infoColor is Color Function(StyleData));

    assert(warningColor != null &&
        (warningColor is Color || warningColor is String) ||
        warningColor is Color Function(StyleData));

    assert(dangerColor != null &&
        (dangerColor is Color || dangerColor is String) ||
        dangerColor is Color Function(StyleData));

    assert(disabledColor != null &&
        (disabledColor is Color || disabledColor is String) ||
        disabledColor is Color Function(StyleData));

    assert(contentColor != null &&
        (contentColor is Color || contentColor is String) ||
        contentColor is Color Function(StyleData));

    return StyleData({
      '$themeName-primaryColor': primaryColor,
      '$themeName-secondaryColor': secondaryColor,
      '$themeName-successColor': successColor,
      '$themeName-infoColor': infoColor,
      '$themeName-warningColor': warningColor,
      '$themeName-dangerColor': dangerColor,
      '$themeName-disabledColor': disabledColor,
      '$themeName-contentColor': contentColor,
    });
  }
}
