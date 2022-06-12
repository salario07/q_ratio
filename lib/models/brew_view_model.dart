import 'package:get/get.dart';
import 'package:q_ratio/shared/constants.dart';
import 'package:q_ratio/shared/shared_pref.dart';

import 'shared/enum/ratio_type.dart';

class BrewViewModel {
  RxDouble water;
  RxDouble coffee;
  RxDouble ratio;

  BrewViewModel({this.water, this.coffee, this.ratio});

  factory BrewViewModel.defaultValue() {
    return BrewViewModel(
        coffee: 0.0.obs,
        ratio: SharedPref.getRatioType().isGram()
            ? Constants.ratioByGramDefaultValue.obs
            : Constants.ratioByKilogramDefaultValue.obs,
        water: 0.0.obs);
  }

  double get totalWeight {
    return coffee() + water();
  }
}

extension ZeroCheck on BrewViewModel {
  bool isRatioZero() {
    return ratio().toPrecision(SharedPref.getRatioType().isGram() ? 1 : 0) ==
        0.0;
  }

  bool isCoffeeZero() {
    return coffee().toPrecision(1) == 0.0;
  }

  bool isWaterZero() {
    return water().toPrecision(0) == 0.0;
  }

  bool isAnyParameterZero() {
    return isRatioZero() || isCoffeeZero() || isWaterZero();
  }
}
