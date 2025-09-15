import 'package:customer_app/config/app_color/app_color.dart';
import 'package:customer_app/config/app_constant/app_constant.dart';
import 'package:customer_app/main.dart';
import 'package:flutter/material.dart';

void showAppSnackBar(String message, {Duration? duration}) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        Expanded(
          child: Text(
            message,
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 14,
              fontWeight: appMediumFont,
            ),
          ),
        ),
      ],
    ),
    showCloseIcon: true,
    closeIconColor: AppColors.primary,
    dismissDirection: DismissDirection.down,
    backgroundColor: AppColors.white,
    behavior: SnackBarBehavior.floating,
    duration: duration ?? Duration(seconds: 3),
  );

  rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
}
