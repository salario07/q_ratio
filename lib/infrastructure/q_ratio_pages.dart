import 'package:get/get.dart';
import 'package:q_ratio/infrastructure/bindings/home_page_binding.dart';
import 'package:q_ratio/infrastructure/q_ratio_routes.dart';
import 'package:q_ratio/views/home_page.dart';
import 'package:q_ratio/views/timer_page.dart';

import 'bindings/timer_page_binding.dart';

class QRatioPages {
  static final List<GetPage> pages = [
    GetPage(
        name: QRatioRoutes.homePage,
        page: () => HomePage(),
        binding: HomePageBinding(),
        children: [
          GetPage(
            name: QRatioRoutes.timerPage,
            page: () => TimerPage(),
            binding: TimerPageBinding(),
          ),
        ]),
  ];
}
