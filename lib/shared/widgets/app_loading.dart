import 'package:customer_app/config/app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget appLoading({Color? color, double? size}) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: SpinKitRing(
        color: color ?? AppColors.white,
        size: size ?? 25.0,
        lineWidth: 2.0,
      ),
    ),
  );
}
