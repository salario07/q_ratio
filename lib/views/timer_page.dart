import 'package:flutter/material.dart';
import 'package:q_ratio/controllers/timer_page_controller.dart';
import 'package:q_ratio/generated/locales.g.dart';
import 'package:q_ratio/shared/constants.dart';
import 'package:q_ratio/shared/dimens.dart';
import 'package:q_ratio/shared/styles.dart';
import 'package:get/get.dart';
import 'package:q_ratio/shared/extensions.dart';

class TimerPage extends GetView<TimerPageController> {
  const TimerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Column(
          children: [
            _infoCard(),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(LocaleKeys.timer_page_timer.tr),
                Constants.smallVerticalSpace,
                Obx(() =>
                    Text(controller.timerTime().formatTimer())),
              ],
            )),
            Constants.largeVerticalSpace,
            _buttons()
          ],
        ),
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
        Text(label),
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
          Text(value.toStringAsFixed(0)),
          Constants.smallHorizontalSpace,
    Text(LocaleKeys.home_page_grams.tr)
        ],
      );
    } else {
      return Text(value.toStringAsFixed(0));
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
    return IconButton(
      icon: Icon(Icons.arrow_back_rounded),
      onPressed: () => Get.back(),
    );
  }

  Widget _pausePlayButton() {
    return Obx(
      () => IconButton(
        icon: Icon(controller.isPaused()
            ? Icons.play_arrow_rounded
            : Icons.pause_rounded),
        onPressed: () => controller.isPaused()
            ? controller.playTimer()
            : controller.pauseTimer(),
      ),
    );
  }

  Widget _resetButton() {
    return IconButton(
      icon: Icon(Icons.replay_rounded),
      onPressed: controller.resetTimer,
    );
  }
}
