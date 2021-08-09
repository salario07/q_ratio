import 'package:flutter/material.dart';
import 'package:taav_ui/taav_ui.dart';

class TaavIconButtonStyleDataBase {
  TaavIconButtonStyleDataBase._();
  static StyleData toStyle({
    @required String themeName,
    @required dynamic tinySize,
    @required dynamic smallSize,
    @required dynamic mediumSize,
    @required dynamic largeSize,
    @required dynamic giantSize,
    @required dynamic tinyPadding,
    @required dynamic smallPadding,
    @required dynamic mediumPadding,
    @required dynamic largePadding,
    @required dynamic giantPadding,
  }) {
    assert(themeName != null && themeName.isNotEmpty);

    assert(tinySize != null &&
        (tinySize is double ||
            tinySize is String ||
            tinySize is double Function(StyleData)));

    assert(smallSize != null &&
        (smallSize is double ||
            smallSize is String ||
            smallSize is double Function(StyleData)));

    assert(mediumSize != null &&
        (mediumSize is double ||
            mediumSize is String ||
            mediumSize is double Function(StyleData)));

    assert(largeSize != null &&
        (largeSize is double ||
            largeSize is String ||
            largeSize is double Function(StyleData)));

    assert(giantSize != null &&
        (giantSize is double ||
            giantSize is String ||
            giantSize is double Function(StyleData)));

    assert(tinyPadding != null &&
        (tinyPadding is EdgeInsetsGeometry ||
            tinyPadding is String ||
            tinyPadding is EdgeInsetsGeometry Function(StyleData)));

    assert(smallPadding != null &&
        (smallPadding is EdgeInsetsGeometry ||
            smallPadding is String ||
            smallPadding is EdgeInsetsGeometry Function(StyleData)));

    assert(mediumPadding != null &&
        (mediumPadding is EdgeInsetsGeometry ||
            mediumPadding is String ||
            mediumPadding is EdgeInsetsGeometry Function(StyleData)));

    assert(largePadding != null &&
        (largePadding is EdgeInsetsGeometry ||
            largePadding is String ||
            largePadding is EdgeInsetsGeometry Function(StyleData)));

    assert(giantPadding != null &&
        (giantPadding is EdgeInsetsGeometry ||
            giantPadding is String ||
            giantPadding is EdgeInsetsGeometry Function(StyleData)));

    return StyleData({
      '$themeName-tinySize': tinySize,
      '$themeName-smallSize': smallSize,
      '$themeName-mediumSize': mediumSize,
      '$themeName-largeSize': largeSize,
      '$themeName-giantSize': giantSize,
      '$themeName-tinyPadding': tinyPadding,
      '$themeName-smallPadding': smallPadding,
      '$themeName-mediumPadding': mediumPadding,
      '$themeName-largePadding': largePadding,
      '$themeName-giantPadding': giantPadding,
    });
  }
}
