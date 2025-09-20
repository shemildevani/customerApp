import 'package:flutter/material.dart';
import 'package:customer_app/config/app_color/app_color.dart';

AppBar buildAppBar({
  required String title,
  bool centerTitle = false,
  List<Widget>? action,
  TextStyle? textStyle,
  IconThemeData? actionsIconTheme,
  Color? backgroundColor,
  bool isRequiredLeading = false,
  PreferredSizeWidget? bottom,
  double? toolbarHeight,
}) {
  return AppBar(
    iconTheme: IconThemeData(color: AppColors.black),
    title: Text(
      title,
      style: textStyle ?? TextStyle(color: AppColors.black, fontSize: 18),
    ),
    leading:
        isRequiredLeading
            ? IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_rounded, color: AppColors.black),
            )
            : null,
    backgroundColor: backgroundColor,
    centerTitle: centerTitle,
    actions: action,
    toolbarHeight: toolbarHeight,
    automaticallyImplyLeading: true,
    bottom: bottom,
    
    actionsIconTheme:
        actionsIconTheme ?? const IconThemeData(color: AppColors.primary),
  );
}
