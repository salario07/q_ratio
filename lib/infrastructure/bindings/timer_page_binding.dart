import 'package:get/get.dart';
import 'package:q_ratio/controllers/timer_page_controller.dart';

class TimerPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TimerPageController());
  }

}