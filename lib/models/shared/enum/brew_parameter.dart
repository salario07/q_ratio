import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:q_ratio/generated/locales.g.dart';
import 'package:get/get.dart';
import 'package:q_ratio/models/shared/enum/ratio_type.dart';
import 'package:q_ratio/shared/shared_pref.dart';

enum BrewParameter { ratio, coffee, water }

extension BrewParameterName on BrewParameter {
  String get name {
    switch (this) {
      case BrewParameter.ratio:
        return LocaleKeys.shared_ratio.tr;
      case BrewParameter.coffee:
        return LocaleKeys.shared_coffee.tr;
      case BrewParameter.water:
        return LocaleKeys.shared_water.tr;
      default:
        return '';
    }
  }

  bool isRatio() {
    return this == BrewParameter.ratio;
  }

  double get step {
    switch (this) {
      case BrewParameter.ratio:
        return SharedPref.getRatioType().isGram() ? 0.1 : 1;
      case BrewParameter.coffee:
        return 0.5;
      case BrewParameter.water:
        return 1;
      default:
        return 0.5;
    }
  }

  String get unit {
    switch (this) {
      case BrewParameter.ratio:
        return SharedPref.getRatioType().isGram()
            ? LocaleKeys.timer_page_gr_gr.tr
            : LocaleKeys.timer_page_kg_gr.tr;
      case BrewParameter.coffee:
        return LocaleKeys.home_page_grams.tr;
      case BrewParameter.water:
        return LocaleKeys.home_page_grams.tr;
      default:
        return '';
    }
  }

  Color get iconColor {
    switch (this) {
      case BrewParameter.ratio:
        return Colors.deepOrange.shade500;
      case BrewParameter.coffee:
        return Color.fromARGB(255, 170, 106, 7);
      case BrewParameter.water:
        return Color.fromARGB(255, 62, 173, 224);
      default:
        return Colors.black;
    }
  }

  Color get backgroundColor {
    switch (this) {
      case BrewParameter.ratio:
        return Colors.deepOrange.shade200;
      case BrewParameter.coffee:
        return Color.fromARGB(255, 172, 136, 81);
      case BrewParameter.water:
        return Color.fromARGB(255, 113, 184, 217);
      default:
        return Color.fromARGB(255, 255, 255, 255);
    }
  }

  String get assetName {
    switch (this) {
      case BrewParameter.ratio:
        return 'assets/piechart.png';
      case BrewParameter.coffee:
        return './assets/piechart.png';
      case BrewParameter.water:
        return '../assets/piechart.png';
      default:
        return 'icons/piechart.png';
    }
  }
}
