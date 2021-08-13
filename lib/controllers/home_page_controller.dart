import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_ratio/infrastructure/q_ratio_routes.dart';
import 'package:q_ratio/models/brew_view_model.dart';
import 'package:q_ratio/shared/constants.dart';
import 'package:q_ratio/shared/extensions.dart';

class HomePageController extends GetxController {
  final TextEditingController coffeeController = TextEditingController(),
      waterController = TextEditingController(),
      ratioController =
          TextEditingController(text: Constants.ratioDefaultValue.toString());
  BrewViewModel brewViewModel = BrewViewModel.defaultValue();

  void calculateWater() {
    brewViewModel.coffee(coffeeController.text.safeToDouble());
    brewViewModel.water(brewViewModel.coffee * brewViewModel.ratio);
    waterController.text = brewViewModel.water().toStringAsFixed(0);
  }

  void calculateCoffee() {
    brewViewModel.water(waterController.text.safeToDouble());
    brewViewModel.coffee(brewViewModel.water / brewViewModel.ratio);
    coffeeController.text = brewViewModel.coffee().toStringAsFixed(0);
  }

  void navigateToTimerPage() {
    Get.toNamed(
      QRatioRoutes.homePage + QRatioRoutes.timerPage,
      arguments: [
        brewViewModel.ratio,
        brewViewModel.coffee(),
        brewViewModel.water()
      ],
    );
  }
}
