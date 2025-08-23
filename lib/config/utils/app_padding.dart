import 'package:flutter/widgets.dart';

abstract class AppPadding {
  static const all8 = EdgeInsets.all(8);
  static const all16 = EdgeInsets.all(16);
  static const horizontal16 = EdgeInsets.symmetric(horizontal: 16);
  static const vertical8 = EdgeInsets.symmetric(vertical: 8);
  static const top16 = EdgeInsets.only(top: 16);
  static const appPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 10);
  static const authPadding = EdgeInsets.symmetric(horizontal: 25);
}
