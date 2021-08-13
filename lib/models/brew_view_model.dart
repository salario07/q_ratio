import 'package:get/get.dart';

class BrewViewModel {
  RxDouble water;
  RxDouble coffee;
  double ratio;

  BrewViewModel({this.water, this.coffee, this.ratio});

  factory BrewViewModel.defaultValue(){
    return BrewViewModel(coffee: 0.0.obs, ratio: 6, water: 0.0.obs);
  }
}
