import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taav_ui/taav_ui.dart';

import 'bootstrap_utils.dart';
import 'constants.dart';
import 'dimens.dart';

class Styles {
  static const TaavWidgetShape buttonShape = TaavWidgetShape.rectangle;
  static const TaavWidgetShape textFieldShape = TaavWidgetShape.semiRound;
  static const TaavWidgetShape dialogShape = TaavWidgetShape.semiRound;

  static const TaavWidgetSize fabSize = TaavWidgetSize.large;
  static const TaavWidgetSize fabSmallSize = TaavWidgetSize.medium;

  static EdgeInsets getResponsiveButtonPadding(bool isWeb) {
    return isWeb ? getHugestButtonPadding() : getLargeButtonPadding();
  }

  static EdgeInsets getHugestButtonPadding() {
    return EdgeInsets.symmetric(
        horizontal: Dimens.button_padding_horizontal_hugest,
        vertical: Dimens.button_padding_vertical);
  }

  static EdgeInsets getHugeButtonPadding() {
    return EdgeInsets.symmetric(
        horizontal: Dimens.button_padding_horizontal_huge,
        vertical: Dimens.button_padding_vertical);
  }

  static EdgeInsets getLargeButtonPadding() {
    return EdgeInsets.symmetric(
        horizontal: Dimens.button_padding_horizontal_large,
        vertical: Dimens.button_padding_vertical);
  }

  static EdgeInsets getMediumButtonPadding() {
    return EdgeInsets.symmetric(
        horizontal: Dimens.button_padding_horizontal_medium,
        vertical: Dimens.button_padding_vertical);
  }

  static EdgeInsets getSmallButtonPadding() {
    return EdgeInsets.symmetric(
        horizontal: Dimens.button_padding_horizontal_small,
        vertical: Dimens.button_padding_vertical_small);
  }

  static RoundedRectangleBorder cardShape() {
    return RoundedRectangleBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(Dimens.attachment_border_radius)),
        side: BorderSide(width: 1, color: Get.theme.dividerColor));
  }

  static RoundedRectangleBorder circleCardShape(double radius) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        side: BorderSide(width: 1, color: Get.theme.dividerColor));
  }

  static RoundedRectangleBorder inkwellBorder() {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.attachment_border_radius));
  }

  static EdgeInsets defaultScaffoldPadding() {
    return EdgeInsets.only(
        bottom: Dimens.scaffoldTopPadding,
        top: Dimens.scaffoldBottomPadding,
        right: Dimens.scaffoldHorizontalPadding,
        left: Dimens.scaffoldHorizontalPadding);
  }

  static EdgeInsets horizontalScaffoldPadding() {
    return EdgeInsets.only(
        bottom: 0,
        top: 0,
        right: Dimens.scaffoldHorizontalPadding,
        left: Dimens.scaffoldHorizontalPadding);
  }

  static EdgeInsets horizontalAndTopScaffoldPadding() {
    return EdgeInsets.only(
        bottom: 0,
        top: 8,
        right: Dimens.scaffoldHorizontalPadding,
        left: Dimens.scaffoldHorizontalPadding);
  }

  static EdgeInsetsDirectional startPadding({double value = 8}) {
    return EdgeInsetsDirectional.only(bottom: 0, top: 0, end: 0, start: value);
  }

  static EdgeInsetsDirectional endPadding({double value = 8}) {
    return EdgeInsetsDirectional.only(bottom: 0, top: 0, end: value, start: 0);
  }

  static EdgeInsetsDirectional startAndEndPadding({double value = 8}) {
    return EdgeInsetsDirectional.only(
        bottom: 0, top: 0, end: value, start: value);
  }

  static double avatarSize() {
    return BootstrapUtils.isScreenWeb() ? 128 : 104;
  }

  static double stepperSize() {
    return BootstrapUtils.isScreenWeb() ? 28 : 22;
  }

  static MainAxisAlignment getResponsiveButtonMainAxisAlignment(bool isWeb) {
    return isWeb ? MainAxisAlignment.center : MainAxisAlignment.spaceEvenly;
  }

  static CrossAxisAlignment getResponsiveTitleCrossAxisAlignment() {
    return BootstrapUtils.isScreenWeb()
        ? CrossAxisAlignment.start
        : CrossAxisAlignment.center;
  }

  static SizedBox getResponsiveTitleTopSpace() {
    return BootstrapUtils.isScreenWeb()
        ? Constants.hugeVerticalSpace
        : Constants.smallVerticalSpace;
  }

  static AlignmentDirectional getTitleResponsiveAlignment() {
    return BootstrapUtils.isScreenWeb()
        ? AlignmentDirectional.centerStart
        : AlignmentDirectional.center;
  }

  static Widget scrollBar({@required Widget child, bool isAlwaysShown = true}) {
    return CupertinoScrollbar(
      isAlwaysShown: isAlwaysShown,
      thickness: Dimens.scroll_bar_thickness,
      radius: Radius.circular(Dimens.scroll_bar_radius),
      child: child,
    );
  }

  static textFieldBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius:
            BorderRadius.all(Radius.circular(Dimens.text_field_border_radius)));
  }

  static textFieldStyled(TaavTextField textField) {
    return TaavTextFieldTheme(
      themeData: TaavTextFieldThemeData(
        focusedBorder: Styles.textFieldBorder(),
        enabledBorder: Styles.textFieldBorder(),
        errorBorder: Styles.textFieldBorder(),
        disabledBorder: Styles.textFieldBorder(),
      ),
      child: textField,
    );
  }
}
