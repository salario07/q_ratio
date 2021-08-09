import 'package:flutter/material.dart';
import 'package:taav_ui/taav_ui.dart';

class MyBaseTheme{
  static StyleData toStyle({
    @required String themeName,
    @required dynamic primaryColor,
    @required dynamic secondaryColor,
    @required dynamic accentColor,
    @required dynamic successColor,
    @required dynamic infoColor,
    @required dynamic warningColor,
    @required dynamic dangerColor,
    @required dynamic disabledColor,
    @required dynamic selectedColor,
    @required dynamic fontFamilyPrimary,
    @required dynamic fontFamilySecondary,
    @required dynamic borderRadiusRectangle,
    @required dynamic borderRadiusRound,
    @required dynamic borderRadiusSemiRound,
  }) {
    assert(themeName != null && themeName.isNotEmpty);

    assert(primaryColor != null &&
        (primaryColor is Color ||
            primaryColor is String ||
            primaryColor is Color Function(StyleData)));

    assert(secondaryColor != null &&
        (secondaryColor is Color ||
            secondaryColor is String ||
            secondaryColor is Color Function(StyleData)));

    assert(accentColor != null &&
        (accentColor is Color ||
            accentColor is String ||
            accentColor is Color Function(StyleData)));

    assert(successColor != null &&
        (successColor is Color ||
            successColor is String ||
            successColor is Color Function(StyleData)));

    assert(infoColor != null &&
        (infoColor is Color ||
            infoColor is String ||
            infoColor is Color Function(StyleData)));

    assert(warningColor != null &&
        (warningColor is Color ||
            warningColor is String ||
            warningColor is Color Function(StyleData)));

    assert(dangerColor != null &&
        (dangerColor is Color ||
            dangerColor is String ||
            dangerColor is Color Function(StyleData)));

    assert(disabledColor != null &&
        (disabledColor is Color ||
            disabledColor is String ||
            disabledColor is Color Function(StyleData)));

    assert(selectedColor != null &&
        (selectedColor is Color ||
            selectedColor is String ||
            selectedColor is Color Function(StyleData)));

    assert(fontFamilyPrimary != null &&
        (fontFamilyPrimary is String ||
            fontFamilyPrimary is String ||
            fontFamilyPrimary is String Function(StyleData)));

    assert(fontFamilySecondary != null &&
        (fontFamilySecondary is String ||
            fontFamilySecondary is String ||
            fontFamilySecondary is String Function(StyleData)));

    assert(borderRadiusRectangle != null &&
        (borderRadiusRectangle is double ||
            borderRadiusRectangle is String ||
            borderRadiusRectangle is double Function(StyleData)));

    assert(borderRadiusRound != null &&
        (borderRadiusRound is double ||
            borderRadiusRound is String ||
            borderRadiusRound is double Function(StyleData)));

    assert(borderRadiusSemiRound != null &&
        (borderRadiusSemiRound is double ||
            borderRadiusSemiRound is String ||
            borderRadiusSemiRound is double Function(StyleData)));

    return StyleData({
      '$themeName-primaryColor': primaryColor,
      '$themeName-secondaryColor': secondaryColor,
      '$themeName-accentColor': accentColor,
      '$themeName-successColor': successColor,
      '$themeName-infoColor': infoColor,
      '$themeName-warningColor': warningColor,
      '$themeName-dangerColor': dangerColor,
      '$themeName-disabledColor': disabledColor,
      '$themeName-selectedColor': selectedColor,
      '$themeName-fontFamilyPrimary': fontFamilyPrimary,
      '$themeName-fontFamilySecondary': fontFamilySecondary,
      '$themeName-borderRadiusRectangle': borderRadiusRectangle,
      '$themeName-borderRadiusRound': borderRadiusRound,
      '$themeName-borderRadiusSemiRound': borderRadiusSemiRound,
    });
  }
}