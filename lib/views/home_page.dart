import 'package:flutter/material.dart';
import 'package:q_ratio/controllers/home_page_controller.dart';
import 'package:q_ratio/shared/constants.dart';
import 'package:q_ratio/shared/my_colors.dart';
import 'package:q_ratio/shared/styles.dart';
import 'package:taav_ui/taav_ui.dart';
import 'package:get/get.dart';
import 'package:q_ratio/shared/extensions.dart';

import '../generated/locales.g.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TaavScaffold(
      backgroundColor: MyColors.backgroundColor,
      showBorder: false,
      body: _body(),
      padding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      isResponsive: true,
    );
  }

  SafeArea _body() {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
              child: Column(
            children: [
              _item(LocaleKeys.shared_ratio.tr, _ratioTextField(), false),
              _divider(),
              _item(LocaleKeys.shared_coffee.tr, _coffeeTextField(), true),
              _divider(),
              _item(LocaleKeys.shared_water.tr, _waterTextField(), true),
            ],
          )),
          _startTimeButton()
        ],
      ),
    );
  }

  Widget _divider() {
    return TaavDivider(
      color: MyColors.dividerColor,
      thickness: 1,
    );
  }

  TaavButton _startTimeButton() {
    return TaavButton.filled(
      label: LocaleKeys.home_page_start_timer.tr,
      onTap: _onStartTimer,
      fillParent: true,
      shape: Styles.buttonShape,
    );
  }

  Widget _item(String title, TaavTextField textField, bool showGrams) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TaavText.heading6(title),
          Constants.tinyVerticalSpace,
          Container(
            alignment: Alignment.center,
            width: Get.width / 3,
            child: Styles.textFieldStyled(textField),
          ),
          if (showGrams) Constants.tinyVerticalSpace,
          if (showGrams) TaavText.body2(LocaleKeys.home_page_grams.tr),
        ],
      ),
    );
  }

  Widget _coffeeTextField() {
    return TaavTextField.flat(
      controller: controller.coffeeController,
      shape: Styles.textFieldShape,
      disableScrollbar: true,
      maxLength: 4,
      taavInputFormatter: TaavInputFormatter.digit,
      textAlign: TextAlign.center,
      showClearIcon: false,
      onChanged: (value) => _onCoffeeChanged(value),
    );
  }

  Widget _waterTextField() {
    return TaavTextField.flat(
      controller: controller.waterController,
      shape: Styles.textFieldShape,
      disableScrollbar: true,
      maxLength: 4,
      taavInputFormatter: TaavInputFormatter.digit,
      textAlign: TextAlign.center,
      showClearIcon: false,
      onChanged: (value) => _onWaterChanged(value),
    );
  }

  Widget _ratioTextField() {
    return TaavTextField.flat(
      controller: controller.ratioController,
      shape: Styles.textFieldShape,
      disableScrollbar: true,
      maxLength: 4,
      taavInputFormatter: TaavInputFormatter.digit,
      textAlign: TextAlign.center,
      showClearIcon: false,
    );
  }

  void _onCoffeeChanged(String coffee) {
    if (controller.brewViewModel.coffee.toStringAsFixed(0) != coffee) {
      controller.calculateWater();
    }
  }

  void _onWaterChanged(String water) {
    if (controller.brewViewModel.water.toStringAsFixed(0) != water) {
      controller.calculateCoffee();
    }
  }

  void _onStartTimer() {}
}
