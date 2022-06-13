import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_ratio/controllers/home_page_controller.dart';
import 'package:q_ratio/generated/locales.g.dart';
import 'package:q_ratio/models/shared/enum/ratio_type.dart';
import 'package:q_ratio/shared/constants.dart';

class SettingsDialog extends GetView<HomePageController> {
  const SettingsDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LocaleKeys.home_page_ratio_type.tr),
          Constants.mediumVerticalSpace,
          _ratioTypeRadio(),
          Constants.largeVerticalSpace,
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 8.0, end: 16),
            child: _buttons(),
          )
        ],
      ),
    );
  }

  Widget _ratioTypeRadio() {
    return Column(
      children: [
        RadioListTile<RatioType>(
          value: RatioType.byGram,
          groupValue: controller.settingsRatioType.value,
          onChanged: controller.settingsRatioType,
          title: Text(LocaleKeys.home_page_coffee_grams_to_water_grams.tr),
        ),
        RadioListTile<RatioType>(
          value: RatioType.byKilogram,
          groupValue: controller.settingsRatioType.value,
          onChanged: controller.settingsRatioType,
          title: Text(LocaleKeys.home_page_water_kilograms_to_coffee_grams.tr),
        ),
      ],
    );
  }

  Widget _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          child: Text(LocaleKeys.shared_cancel.tr),
          onPressed: Get.back,
        ),
        Constants.largeHorizontalSpace,
        ElevatedButton(
          child: Text(LocaleKeys.shared_save.tr),
          onPressed: _save,
        ),
      ],
    );
  }

  void _save() {
    controller.updateRatioType();
    Get.back();
  }

  /*void show(final BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => this,
      barrierDismissible: false,
    );
  }*/
}
