import 'package:q_ratio/models/brew_view_model.dart';

abstract class RatioStrategy {

  BrewViewModel brewViewModel;

  RatioStrategy(this.brewViewModel);

  double calculateWater();

  double calculateCoffee();

  bool isRatioValid();

  String hint();

  double defaultValue();

  String defaultValueString();
}
