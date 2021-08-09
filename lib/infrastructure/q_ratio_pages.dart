import 'package:get/get.dart';
import 'package:q_ratio/infrastructure/bindings/home_page_binding.dart';
import 'package:q_ratio/infrastructure/q_ratio_routes.dart';
import 'package:q_ratio/views/home_page.dart';
import 'package:q_ratio/views/timer_page.dart';

import 'bindings/timer_page_binding.dart';

class QRatioPages {
  static List<GetPage> getPages() {
    return [
      GetPage(
          name: QRatioRoutes.homePage,
          page: () => HomePage(),
          binding: HomePageBinding()),
      GetPage(
          name: QRatioRoutes.homePage,
          page: () => TimerPage(),
          binding: TimerPageBinding()),
    ];
  }
}
