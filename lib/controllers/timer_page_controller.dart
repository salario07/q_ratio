import 'dart:async';

import 'package:get/get.dart';
import 'package:q_ratio/models/brew_view_model.dart';

class TimerPageController extends GetxController {
  BrewViewModel brewViewModel = BrewViewModel.defaultValue();
  RxInt timerTime = 0.obs;
  RxBool isPaused = false.obs;
  Timer timer;

  void _startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (!isPaused()) timerTime(timerTime() + 1);
      },
    );
  }

  void resetTimer() {
    timer.cancel();
    timerTime(0);
    _startTimer();
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
    if (Get.arguments != null) {
      brewViewModel.ratio.value = Get.arguments?.first ?? 0;
      brewViewModel.coffee.value = Get.arguments?.elementAt(1) ?? 0;
      brewViewModel.water.value = Get.arguments?.elementAt(2) ?? 0;
    }
    _startTimer();
  }
}
