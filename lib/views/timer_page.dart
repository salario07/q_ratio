import 'package:flutter/material.dart';
import 'package:q_ratio/controllers/timer_page_controller.dart';
import 'package:q_ratio/generated/locales.g.dart';
import 'package:q_ratio/shared/constants.dart';
import 'package:q_ratio/shared/dimens.dart';
import 'package:q_ratio/shared/my_colors.dart';
import 'package:q_ratio/shared/styles.dart';
import 'package:taav_ui/taav_ui.dart';
import 'package:get/get.dart';

class TimerPage extends GetView<TimerPageController> {
  const TimerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TaavScaffold(
        backgroundColor: MyColors.backgroundColor,
        showBorder: false,
        body: _body(),
        padding: EdgeInsets.zero,
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 24));
  }

  Widget _body() {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
              child: Column(
            children: [_infoCard()],
          )),
          Constants.largeVerticalSpace,
          _buttons()
        ],
      ),
    );
  }

  Widget _infoCard() {
    return Card(
      shape: Styles.cardShape(),
      margin: EdgeInsets.zero,
      elevation: Dimens.elevation,
      child: Padding(padding: EdgeInsets.all(16), child: _infoContent()),
    );
  }

  Widget _infoContent() {
    return Column(children: [
      _infoItem(LocaleKeys.shared_ratio.tr, controller.brewViewModel.ratio,
          showGrams: false),
      Constants.mediumVerticalSpace,
      _infoItem(LocaleKeys.shared_coffee.tr, controller.brewViewModel.coffee()),
      Constants.mediumVerticalSpace,
      _infoItem(LocaleKeys.shared_water.tr, controller.brewViewModel.water()),
    ]);
  }

  Widget _infoItem(String label, double value, {bool showGrams = true}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TaavText.button(label),
        Expanded(
          child: Align(
            alignment: AlignmentDirectional.centerEnd,
            child: _infoValue(value, showGrams),
          ),
        )
      ],
    );
  }

  Widget _infoValue(double value, bool showGrams) {
    if (showGrams) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TaavText.subtitle1(value.toStringAsFixed(0)),
          Constants.smallHorizontalSpace,
          TaavText.caption2(LocaleKeys.home_page_grams.tr)
        ],
      );
    } else {
      return TaavText.subtitle1(value.toStringAsFixed(0));
    }
  }

  Widget _buttons() {
    return SizedBox();
  }
}
