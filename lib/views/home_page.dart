import 'package:flutter/material.dart';
import 'package:q_ratio/controllers/home_page_controller.dart';
import 'package:q_ratio/shared/constants.dart';
import 'package:get/get.dart';
import 'package:q_ratio/shared/extensions.dart';
import '../generated/locales.g.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
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
          Constants.largeVerticalSpace,
          _startTimeButton()
        ],
      ),
    ));
  }

  Widget _divider() {
    return Divider(
      thickness: 1,
    );
  }

  Widget _startTimeButton() {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller.waterController,
      builder: (context, waterAmount, child) =>
          ValueListenableBuilder<TextEditingValue>(
        valueListenable: controller.coffeeController,
        builder: (context, coffeeAmount, child) => ElevatedButton(
          child: Text(LocaleKeys.home_page_start_brew.tr),
          onPressed: double.tryParse(coffeeAmount.text) == 0.0 ||
                  double.tryParse(waterAmount.text) == 0.0
              ? null
              : controller.navigateToTimerPage,
        ),
      ),
    );
  }

  Widget _item(String title, TextField textField, bool showGrams) {
    return Flexible(
        fit: FlexFit.tight,
        flex: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            Constants.tinyVerticalSpace,
            Container(
              alignment: Alignment.center,
              width: Get.width / 3,
              child: textField,
            ),
            if (showGrams) Constants.tinyVerticalSpace,
            if (showGrams) Text(LocaleKeys.home_page_grams.tr),
          ],
        ));
  }

  Widget _coffeeTextField() {
    return TextField(
      controller: controller.coffeeController,
      maxLength: 4,
      textAlign: TextAlign.center,
      onChanged: (value) => _onCoffeeChanged(value),
    );
  }

  Widget _waterTextField() {
    return TextField(
      controller: controller.waterController,
      maxLength: 4,
      textAlign: TextAlign.center,
      onChanged: (value) => _onWaterChanged(value),
    );
  }

  Widget _ratioTextField() {
    return TextField(
      controller: controller.ratioController,
      maxLength: 4,
      textAlign: TextAlign.center,
      onChanged: (value) => _onRatioChanged(value),
    );
  }

  void _onCoffeeChanged(String coffee) {
    if (controller.getBrew().coffee().toOneDigitDecimal() != coffee) {
      controller
          .getBrew()
          .coffee(controller.coffeeController.text.safeToDouble());
      controller.calculateWater();
    }
  }

  void _onWaterChanged(String water) {
    if (controller.getBrew().water().toNoDigitDecimal() != water) {
      controller
          .getBrew()
          .water(controller.waterController.text.safeToDouble());
      controller.calculateCoffee();
    }
  }

  void _onRatioChanged(String ratio) {
    controller.getBrew().ratio(ratio.safeToDouble());
    controller.calculateWater();
  }
}
