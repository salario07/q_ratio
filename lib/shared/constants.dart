import 'package:flutter/material.dart';

import 'dimens.dart';

class Constants {
  static const SizedBox tinyVerticalSpace = SizedBox(height: Dimens.tiny_space);
  static const SizedBox smallVerticalSpace =
      SizedBox(height: Dimens.small_space);
  static const SizedBox mediumVerticalSpace =
      SizedBox(height: Dimens.medium_space);
  static const SizedBox largeVerticalSpace =
      SizedBox(height: Dimens.large_space);
  static const SizedBox hugeVerticalSpace = SizedBox(height: Dimens.huge_space);
  static const SizedBox hugestVerticalSpace =
      SizedBox(height: Dimens.hugest_space);

  static const SizedBox tinyHorizontalSpace =
      SizedBox(width: Dimens.tiny_space);
  static const SizedBox smallHorizontalSpace =
      SizedBox(width: Dimens.small_space);
  static const SizedBox mediumHorizontalSpace =
      SizedBox(width: Dimens.medium_space);
  static const SizedBox largeHorizontalSpace =
      SizedBox(width: Dimens.large_space);
  static const SizedBox hugeHorizontalSpace =
      SizedBox(width: Dimens.huge_space);
  static const SizedBox hugestHorizontalSpace =
      SizedBox(width: Dimens.hugest_space);

  static const double ratioByGramDefaultValue = 16;
  static const double ratioByKilogramDefaultValue = 50;

  static const int ratioTypeGram = 1;
  static const int ratioTypeKilogram = 2;

  static const int addMinusDelayMilliseconds = 150;

  static const String ratioType = 'ratioType';
}
