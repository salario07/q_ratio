import 'package:bootstrap/bootstrap.dart';
import 'package:flutter/material.dart';
import 'package:q_ratio/controllers/timer_page_controller.dart';
import 'package:q_ratio/generated/locales.g.dart';
import 'package:q_ratio/models/shared/enum/brew_parameter.dart';
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
    return Padding(
      padding: const EdgeInsets.all(24),
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
                  Text(controller.timerTime.value.formatTimer())),
            ],
          )),
          Constants.largeVerticalSpace,
          _buttons()
        ],
      ),
    );
  }

  Widget _infoCard() {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600),
        child: Card(
          shape: Styles.cardShape(),
          margin: EdgeInsets.zero,
          elevation: Dimens.elevation,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: _infoContent()),
        ),
      ),
    );
  }

  Widget _infoContent() {
    return Column(
      children: [
        _infoItems(),
        Constants.mediumVerticalSpace,
        _verticalDivider(),
        Constants.mediumVerticalSpace,
        _totalWeight()
      ],
    );
  }

  Container _verticalDivider() {
    return Container(
      height: 1,
      width: 120,
      color: Colors.grey,
    );
  }

  Row _infoItems() {
    return Row(children: [
      _infoItem(
        BrewParameter.ratio,
        '1 : ${controller.brewViewModel.ratio().toOneDigitDecimal()}',
      ),
      _horizontalDivider(),
      _infoItem(
        BrewParameter.coffee,
        controller.brewViewModel.coffee().toOneDigitDecimal(),
      ),
      _horizontalDivider(),
      _infoItem(
        BrewParameter.water,
        controller.brewViewModel.water().toOneDigitDecimal(),
      ),
    ]);
  }

  Row _totalWeight() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(LocaleKeys.timer_page_total_weight.tr),
        Constants.smallHorizontalSpace,
        Text(controller.brewViewModel.totalWeight.toOneDigitDecimal()),
        Constants.smallHorizontalSpace,
        Text(LocaleKeys.home_page_grams.tr),
      ],
    );
  }

  Container _horizontalDivider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.grey,
    );
  }

  Widget _infoItem(BrewParameter brewParameter, String value) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: Column(
        children: [
          Text(value/*.toStringAsFixed(0)*/),
          Constants.smallHorizontalSpace,
    Text(LocaleKeys.home_page_grams.tr)
        ],
      ));
  }

  Widget _buttons() {
    return Bootstrap(
      children: [
        Div(
          childXs: () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _backButton(),
              _pausePlayButton(),
              _resetButton(),
            ],
          ),
          colXs: 11,
          colSm: 10,
          colMd: 8,
          colLg: 6,
          colXl: 4,
        ),
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
