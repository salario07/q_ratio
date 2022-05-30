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

  SafeArea _body() {
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
      ),
    );
  }

  Widget _divider() {
    return Divider(
      thickness: 1,
    );
  }

  Widget _startTimeButton() {
    return Obx(
      () => ElevatedButton(
        child: Text(LocaleKeys.home_page_start_timer.tr),
        onPressed: controller.brewViewModel.coffee() == 0.0 ||
                controller.brewViewModel.water() == 0.0
            ? null
            : controller.navigateToTimerPage,
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
      ),
    );
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
        onChanged: (value) {
          controller.brewViewModel.ratio = value.safeToDouble();
          controller.calculateWater();
        });
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
}
