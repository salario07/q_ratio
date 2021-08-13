import 'package:get/get.dart';
import 'package:q_ratio/models/brew_view_model.dart';

class TimerPageController extends GetxController {
  BrewViewModel brewViewModel = BrewViewModel.defaultValue();

  @override
  void onInit() {
    super.onInit();
    brewViewModel.ratio = Get.arguments[0];
    brewViewModel.coffee(Get.arguments[1]);
    brewViewModel.water(Get.arguments[2]);
  }
}
