import 'package:flutter/material.dart';
import 'package:q_ratio/controllers/timer_page_controller.dart';
import 'package:q_ratio/generated/locales.g.dart';
import 'package:q_ratio/shared/constants.dart';
import 'package:q_ratio/shared/dimens.dart';
import 'package:q_ratio/shared/my_colors.dart';
import 'package:q_ratio/shared/styles.dart';
import 'package:taav_ui/taav_ui.dart';
import 'package:get/get.dart';
import 'package:q_ratio/shared/extensions.dart';

class TimerPage extends GetView<TimerPageController> {
  const TimerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TaavScaffold(
        backgroundColor: MyColors.backgroundColor,
        showBorder: false,
        body: _body(),
        padding: EdgeInsets.zero,
        contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 24));
  }

  Widget _body() {
    return SafeArea(
      child: Column(
        children: [
          _infoCard(),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TaavText.body2(LocaleKeys.timer_page_timer.tr),
              Constants.smallVerticalSpace,
              Obx(() =>
                  TaavText.heading3(controller.timerTime().formatTimer())),
            ],
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _backButton(),
        _pausePlayButton(),
        _resetButton(),
      ],
    );
  }

  Widget _backButton() {
    return TaavIconButton.outline(
      icon: Icons.arrow_back_rounded,
      onTap: () => Get.back(),
      shape: Styles.iconButtonShape,
      size: TaavWidgetSize.large,
    );
  }

  Widget _pausePlayButton() {
    return Obx(
      () => TaavIconButton.filled(
        icon: controller.isPaused()
            ? Icons.play_arrow_rounded
            : Icons.pause_rounded,
        onTap: () => controller.isPaused()
            ? controller.playTimer()
            : controller.pauseTimer(),
        shape: Styles.iconButtonShape,
        size: TaavWidgetSize.giant,
      ),
    );
  }

  Widget _resetButton() {
    return TaavIconButton.outline(
      icon: Icons.replay_rounded,
      onTap: controller.resetTimer,
      shape: Styles.iconButtonShape,
      size: TaavWidgetSize.large,
    );
  }
}
