import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_ratio/models/brew_view_model.dart';
import 'package:q_ratio/shared/extensions.dart';

class HomePageController extends GetxController {
  final TextEditingController coffeeController = TextEditingController(),
      waterController = TextEditingController(),
      ratioController = TextEditingController();
  BrewViewModel brewViewModel = BrewViewModel(coffee: 0, ratio: 6, water: 0);

  void calculateWater() {
    double ratio = 6;
    double coffee = coffeeController.text.safeToDouble();
    double water = coffee * ratio;
    brewViewModel.coffee = coffee;
    brewViewModel.water = water;
    waterController.text = water.toStringAsFixed(0);
  }

  void calculateCoffee() {
    double ratio = 6;
    double water = waterController.text.safeToDouble();
    double coffee = water / ratio;
    brewViewModel.coffee = coffee;
    brewViewModel.water = water;
    coffeeController.text = coffee.toStringAsFixed(0);
  }
}
