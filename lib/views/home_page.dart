import 'package:flutter/material.dart';
import 'package:taav_ui/taav_ui.dart';
import 'package:get/get.dart';

import '../generated/locales.g.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TaavScaffold(
      showBorder: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Column(
              children: [_ratioAmount(), _coffeeAmount(), _waterAmount()],
            )),
            TaavButton.filled(
                label: LocaleKeys.home_page_start_timer.tr, onTap: _onStartTimer)
          ],
        ),
      ),
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
