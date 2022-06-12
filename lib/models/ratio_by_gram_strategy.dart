import 'package:q_ratio/generated/locales.g.dart';
import 'package:q_ratio/models/brew_view_model.dart';
import 'package:q_ratio/models/ratio_strategy.dart';
import 'package:get/get.dart';
import 'package:q_ratio/shared/extensions.dart';

class RatioByGramStrategy implements RatioStrategy {
  @override
  BrewViewModel brewViewModel;

  RatioByGramStrategy(this.brewViewModel) : super();

  @override
  double calculateCoffee() {
    if (isRatioValid()) {
      brewViewModel.coffee(brewViewModel.water() / brewViewModel.ratio());
    }
    return brewViewModel.coffee();
  }

  @override
  double calculateWater() {
    if (isRatioValid()) {
      brewViewModel.water(brewViewModel.coffee() * brewViewModel.ratio());
    }
    return brewViewModel.water();
  }

  @override
  bool isRatioValid() {
    return brewViewModel.ratio() > 0;
  }

  @override
  String hint() {
    return LocaleKeys.home_page_coffee_grams_to_water_grams.tr;
  }

  @override
  double defaultValue() {
    return 16;
  }

  @override
  String defaultValueString() {
    return defaultValue().toOneDigitDecimal();
  }
}
