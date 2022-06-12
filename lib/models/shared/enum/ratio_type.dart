import 'package:q_ratio/generated/locales.g.dart';
import 'package:q_ratio/models/brew_view_model.dart';
import 'package:q_ratio/models/ratio_by_gram_strategy.dart';
import 'package:q_ratio/models/ratio_by_kilogram_strategy.dart';
import 'package:q_ratio/models/ratio_strategy.dart';
import 'package:q_ratio/shared/constants.dart';
import 'package:get/get.dart';

enum RatioType { byGram, byKilogram }

extension isRatioTypeGram on RatioType {
  bool isGram() {
    return this == RatioType.byGram;
  }

  RatioStrategy getRatioStrategy(BrewViewModel brewViewModel) {
    if (this == RatioType.byGram) {
      return RatioByGramStrategy(brewViewModel);
    } else {
      return RatioByKilogramStrategy(brewViewModel);
    }
  }

  int toInt() {
    return this == RatioType.byKilogram
        ? Constants.ratioTypeKilogram
        : Constants.ratioTypeGram;
  }

  String hint() {
    return this == RatioType.byKilogram
        ? LocaleKeys.home_page_water_kilograms_to_coffee_grams.tr
        : LocaleKeys.home_page_coffee_grams_to_water_grams.tr;
  }
}

extension ToRatioType on int {
  RatioType toRatioType() {
    return this == Constants.ratioTypeKilogram
        ? RatioType.byKilogram
        : RatioType.byGram;
  }
}
