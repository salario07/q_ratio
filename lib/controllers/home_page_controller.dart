import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_ratio/infrastructure/q_ratio_routes.dart';
import 'package:q_ratio/models/brew_view_model.dart';
import 'package:q_ratio/models/ratio_by_gram_strategy.dart';
import 'package:q_ratio/models/ratio_by_kilogram_strategy.dart';
import 'package:q_ratio/models/ratio_strategy.dart';
import 'package:q_ratio/models/shared/enum/brew_parameter.dart';
import 'package:q_ratio/shared/constants.dart';
import 'package:q_ratio/shared/extensions.dart';
import 'package:q_ratio/models/shared/enum/ratio_type.dart';
import 'package:q_ratio/shared/shared_pref.dart';

class HomePageController extends GetxController {
  final TextEditingController coffeeController = TextEditingController(),
      waterController = TextEditingController(),
      ratioController = TextEditingController(
          text: Constants.ratioByGramDefaultValue.toOneDigitDecimal());
  Timer timer;
  Rx<RatioType> ratioType = RatioType.byGram.obs;
  Rx<RatioType> settingsRatioType = RatioType.byGram.obs;
  RatioStrategy ratioStrategy =
      RatioByGramStrategy(BrewViewModel.defaultValue());

  void calculateWater() {
    if (isRatioValid()) {
      getBrew().water(ratioStrategy.calculateWater());
      waterController.text = getBrew().water().toNoDigitDecimal();
    }
  }

  void calculateCoffee() {
    if (isRatioValid()) {
      getBrew().coffee(ratioStrategy.calculateCoffee());
      coffeeController.text = getBrew().coffee().toOneDigitDecimal();
    }
  }

  void navigateToTimerPage() {
    Get.toNamed(
      QRatioRoutes.homePage + QRatioRoutes.timerPage,
      arguments: [getBrew().ratio(), getBrew().coffee(), getBrew().water()],
    );
  }

  bool isRatioValid() {
    return getBrew().ratio() != 0;
  }

  void onMinus(BrewParameter brewParameter) {
    switch (brewParameter) {
      case BrewParameter.ratio:
        if (getBrew().ratio() - brewParameter.step >= 0) {
          ratioController.text =
              (getBrew().ratio() - brewParameter.step).toOneDigitDecimal();
        } else {
          ratioController.text = '0';
        }
        break;
      case BrewParameter.coffee:
        if (getBrew().coffee() - brewParameter.step >= 0) {
          coffeeController.text =
              (getBrew().coffee() - brewParameter.step).toOneDigitDecimal();
        } else {
          coffeeController.text = '0';
        }
        break;
      case BrewParameter.water:
        if (getBrew().water() - brewParameter.step >= 0) {
          waterController.text =
              (getBrew().water() - brewParameter.step).toNoDigitDecimal();
        } else {
          waterController.text = '0';
        }
        break;
      default:
        break;
    }
  }

  void onAdd(BrewParameter brewParameter) {
    switch (brewParameter) {
      case BrewParameter.ratio:
        ratioController.text =
            (getBrew().ratio() + brewParameter.step).toOneDigitDecimal();
        break;
      case BrewParameter.coffee:
        coffeeController.text =
            (getBrew().coffee() + brewParameter.step).toOneDigitDecimal();
        break;
      case BrewParameter.water:
        waterController.text =
            (getBrew().water() + brewParameter.step).toNoDigitDecimal();
        break;
      default:
        break;
    }
  }

  void onHoldAddMinus(BrewParameter brewParameter, bool isAdd) {
    timer = Timer.periodic(
        Duration(milliseconds: Constants.addMinusDelayMilliseconds), (t) {
      if (isAdd) {
        onAdd(brewParameter);
      } else {
        onMinus(brewParameter);
      }
    });
  }

  void onCancelHoldAddMinus() {
    timer.cancel();
  }

  BrewViewModel getBrew() {
    return ratioStrategy.brewViewModel;
  }

  @override
  void onInit() {
    super.onInit();
    ratioType(SharedPref.getRatioType());
    settingsRatioType(SharedPref.getRatioType());
    ratioStrategy = ratioType().isGram()
        ? RatioByGramStrategy(getBrew())
        : RatioByKilogramStrategy(getBrew());
    ratioController.text = ratioStrategy.defaultValueString();
  }

  void updateRatioType() {
    ratioType(settingsRatioType());
    SharedPref.setRatioType(settingsRatioType());
    ratioStrategy =
        settingsRatioType().getRatioStrategy(ratioStrategy.brewViewModel);
    ratioController.text = ratioStrategy.defaultValueString();
  }
}
