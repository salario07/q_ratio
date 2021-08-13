import 'package:get/get.dart';
import 'package:q_ratio/shared/constants.dart';

class BrewViewModel {
  RxDouble water;
  RxDouble coffee;
  double ratio;

  BrewViewModel({this.water, this.coffee, this.ratio});

  factory BrewViewModel.defaultValue() {
    return BrewViewModel(
        coffee: 0.0.obs, ratio: Constants.ratioDefaultValue, water: 0.0.obs);
  }
}
