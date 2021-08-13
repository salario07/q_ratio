import 'package:get/get.dart';

class BrewViewModel {
  RxDouble water;
  RxDouble coffee;
  double ratio;

  BrewViewModel({this.water, this.coffee, this.ratio});
}
