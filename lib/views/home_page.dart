import 'package:flutter/material.dart';
import 'package:q_ratio/controllers/home_page_controller.dart';
import 'package:q_ratio/shared/constants.dart';
import 'package:q_ratio/shared/my_colors.dart';
import 'package:q_ratio/shared/styles.dart';
import 'package:taav_ui/taav_ui.dart';
import 'package:get/get.dart';

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
              _ratioAmount(),
              _divider(),
              _coffeeAmount(),
              _divider(),
              _waterAmount()
            ],
          )),
          _startTimeButton()
        ],
      ),
    );
  }

  Widget _divider() {
    return TaavDivider(
              color: Get.theme.dividerColor,
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

  Widget _coffeeAmount() {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: Column(
        children: [
          TaavText.heading6(LocaleKeys.shared_coffee.tr),
          Container(
            margin: EdgeInsets.symmetric(horizontal: Get.width / 5),
            child: TaavTextField.flat(
              controller: controller.coffeeController,
              shape: Styles.textFieldShape,
              disableScrollbar: true,
              maxLength: 4,
              taavInputFormatter: TaavInputFormatter.digit,
            ),
          ),
          TaavText.body2(LocaleKeys.home_page_grams.tr),
        ],
      ),
    );
  }

  Widget _waterAmount() {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: Column(
        children: [
          TaavText.heading6(LocaleKeys.shared_water.tr),
          Constants.tinyVerticalSpace,
          Container(
            margin: EdgeInsets.symmetric(horizontal: Get.width / 5),
            child: TaavTextField.flat(
              controller: controller.waterController,
              shape: Styles.textFieldShape,
              disableScrollbar: true,
              maxLength: 4,
              taavInputFormatter: TaavInputFormatter.digit,
            ),
          ),
          TaavText.body2(LocaleKeys.home_page_grams.tr),
        ],
      ),
    );
  }

  Widget _ratioAmount() {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: Column(
        children: [
          TaavText.heading6(LocaleKeys.shared_ratio.tr),
          Constants.tinyVerticalSpace,
          Container(
            margin: EdgeInsets.symmetric(horizontal: Get.width / 5),
            child: TaavTextFieldTheme(
              themeData: TaavTextFieldThemeData(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              child: TaavTextField.flat(
                controller: controller.ratioController,
                shape: Styles.textFieldShape,
                disableScrollbar: true,
                maxLength: 4,
                taavInputFormatter: TaavInputFormatter.digit,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onStartTimer() {}
}
