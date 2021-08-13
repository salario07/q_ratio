import 'dart:async';

import 'package:get/get.dart';
import 'package:q_ratio/models/brew_view_model.dart';

class TimerPageController extends GetxController {
  BrewViewModel brewViewModel = BrewViewModel.defaultValue();
  RxInt timerTime = 0.obs;
  RxBool isPaused = false.obs;

  void _startTimer() {
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (!isPaused()) timerTime(timerTime() + 1);
      },
    );
  }

  void resetTimer() {
    timerTime(0);
  }

  void pauseTimer() {
    isPaused(true);
  }

  void playTimer() {
    isPaused(false);
  }

  @override
  void onInit() {
    super.onInit();
    brewViewModel.ratio = Get.arguments[0];
    brewViewModel.coffee(Get.arguments[1]);
    brewViewModel.water(Get.arguments[2]);
    _startTimer();
  }
}
