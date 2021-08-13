import 'package:get/get.dart';
import 'package:q_ratio/models/brew_view_model.dart';

class TimerPageController extends GetxController {
  BrewViewModel brewViewModel =
      BrewViewModel(coffee: 0.0.obs, ratio: 6, water: 0.0.obs);

  @override
  void onInit() {
    super.onInit();
    brewViewModel = BrewViewModel(
        ratio: Get.arguments[0],
        coffee: Get.arguments[1],
        water: Get.arguments[2]);
  }
}
