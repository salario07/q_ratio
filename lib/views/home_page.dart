import 'package:flutter/material.dart';
import 'package:q_ratio/shared/styles.dart';
import 'package:taav_ui/taav_ui.dart';
import 'package:get/get.dart';

import '../generated/locales.g.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TaavScaffold(
      showBorder: false,
      body: _body(),
      padding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
      isResponsive: true,
    );
  }

  SafeArea _body() {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
              child: Column(
            children: [_ratioAmount(), _coffeeAmount(), _waterAmount()],
          )),
          _startTimeButton()
        ],
      ),
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
      child: TaavText.heading6(LocaleKeys.shared_coffee.tr),
    );
  }

  Widget _waterAmount() {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: TaavText.heading6(LocaleKeys.shared_water.tr),
    );
  }

  Widget _ratioAmount() {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: TaavText.heading6(LocaleKeys.shared_ratio.tr),
    );
  }

  void _onStartTimer() {}
}
