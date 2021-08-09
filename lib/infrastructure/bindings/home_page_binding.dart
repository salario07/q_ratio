import 'package:get/get.dart';
import 'package:q_ratio/controllers/home_page_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
}
