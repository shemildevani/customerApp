import 'package:flutter/widgets.dart';

abstract class AppRadius {
  static const small = Radius.circular(4);
  static const medium = Radius.circular(8);
  static const large = Radius.circular(16);

  static const borderSmall = BorderRadius.all(small);
  static const borderMedium = BorderRadius.all(medium);
  static const borderLarge = BorderRadius.all(large);
}

const double kBorderRadius = 8;
