import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_ratio/models/shared/enum/screen_size.dart';

class BootstrapUtils {
  static const double _smallWidth = 540.0;
  static const double _mediumWidth = 720.0;
  static const double _largeWidth = 960.0;
  static const double _extraLargeWidth = 1140.0;

  static ScreenSize screenSize() {
    double width = Get.width;
    if (width < _smallWidth) {
      return ScreenSize.xs;
    } else if (width < _mediumWidth) {
      return ScreenSize.sm;
    } else if (width < _largeWidth) {
      return ScreenSize.md;
    } else if (width < _extraLargeWidth) {
      return ScreenSize.lg;
    } else {
      return ScreenSize.xl;
    }
  }

  static bool isScreenWeb() {
    return GetPlatform.isWeb && Get.width >= _largeWidth;
  }

  static bool isScreenLarge() {
    return Get.width >= _largeWidth;
  }

  static EdgeInsets screenHorizontalPaddingBySize() {
    switch (screenSize()) {
      case ScreenSize.xs:
        return EdgeInsets.symmetric(horizontal: 0);
      case ScreenSize.sm:
        return EdgeInsets.symmetric(horizontal: 0);
      case ScreenSize.md:
        return EdgeInsets.symmetric(horizontal: Get.width * 0.085);
      case ScreenSize.lg:
        return EdgeInsets.symmetric(horizontal: Get.width * 0.005);
      case ScreenSize.xl:
        return EdgeInsets.symmetric(horizontal: Get.width * 0.065);
      default:
        return EdgeInsets.zero;
    }
  }

  static EdgeInsets screenHorizontalPaddingBySizeLarge() {
    switch (screenSize()) {
      case ScreenSize.xs:
        return EdgeInsets.symmetric(horizontal: 0);
      case ScreenSize.sm:
        return EdgeInsets.symmetric(horizontal: 0);
      case ScreenSize.md:
        return EdgeInsets.symmetric(horizontal: Get.width * 0.150);
      case ScreenSize.lg:
        return EdgeInsets.symmetric(horizontal: Get.width * 0.01);
      case ScreenSize.xl:
        return EdgeInsets.symmetric(horizontal: Get.width * 0.170);
      default:
        return EdgeInsets.zero;
    }
  }

  static EdgeInsets screenHorizontalPaddingBySizeAndRatio(double ratio) {
    switch (screenSize()) {
      case ScreenSize.xs:
        return EdgeInsets.symmetric(horizontal: 0);
      case ScreenSize.sm:
        return EdgeInsets.symmetric(horizontal: 0);
      case ScreenSize.md:
        return EdgeInsets.symmetric(horizontal: Get.width * 0.085 * ratio);
      case ScreenSize.lg:
        return EdgeInsets.symmetric(horizontal: Get.width * 0.055 * ratio);
      case ScreenSize.xl:
        return EdgeInsets.symmetric(horizontal: Get.width * 0.065 * ratio);
      default:
        return EdgeInsets.zero;
    }
  }

  static BoxConstraints constraints() {
    double widthFactor;
    switch (screenSize()) {
      case ScreenSize.xs:
      case ScreenSize.sm:
      case ScreenSize.md:
        widthFactor = 1;
        break;
      case ScreenSize.lg:
        widthFactor = 0.85;
        break;
      case ScreenSize.xl:
        widthFactor = 0.7;
        break;
      default:
        widthFactor = 1;
        break;
    }
    return BoxConstraints(maxWidth: Get.width * widthFactor);
  }

  static Widget divPadding(
      {double end = 0, double start = 0, @required Widget child}) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        end: end,
        start: start,
      ),
      child: child,
    );
  }

  static Widget paddingTwoColumn(
      {@required Widget child, @required int index}) {
    switch (index % 2) {
      case 0:
        return BootstrapUtils.divPadding(child: child, end: 12, start: 0);
      case 1:
        return BootstrapUtils.divPadding(child: child, end: 0, start: 12);
      default:
        return BootstrapUtils.divPadding(child: child, end: 12, start: 0);
    }
  }

  static EdgeInsets horizontalMobilePadding(double value) {
    return BootstrapUtils.isScreenWeb()
        ? EdgeInsets.zero
        : EdgeInsets.symmetric(horizontal: value);
  }

  static EdgeInsets bottomWebPadding(double value) {
    return !BootstrapUtils.isScreenWeb()
        ? EdgeInsets.zero
        : EdgeInsets.only(bottom: value);
  }

  static EdgeInsetsDirectional webTitlePadding(double value) {
    return !BootstrapUtils.isScreenWeb()
        ? EdgeInsetsDirectional.zero
        : EdgeInsetsDirectional.only(start: value);
  }
}
