import 'package:get_storage/get_storage.dart';
import 'package:q_ratio/models/shared/enum/ratio_type.dart';
import 'package:q_ratio/shared/constants.dart';

class SharedPref {
  static void setRatioType(RatioType ratioType) {
    GetStorage().write(Constants.ratioType, ratioType.toInt());
  }

  static RatioType getRatioType() {
    int type = GetStorage().read(Constants.ratioType);
    if (type == null) {
      return RatioType.byGram;
    } else {
      return type.toRatioType();
    }
  }
}
