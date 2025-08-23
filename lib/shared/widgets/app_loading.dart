import 'package:flutter/material.dart';

Widget appLoading({Color? color}) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: CircularProgressIndicator(
        color: color ?? Colors.white,
        strokeWidth: 4,
      ),
    ),
  );
}
