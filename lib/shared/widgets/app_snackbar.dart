import 'package:customer_app/config/app_color/app_color.dart';
import 'package:customer_app/config/app_constant/app_constant.dart';
import 'package:customer_app/main.dart';
import 'package:customer_app/shared/widgets/app_text.dart';
import 'package:flutter/material.dart';

void showAppSnackBar(
  String message, {
  Duration? duration,
  bool isError = false,
}) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        // leading icon with background
        Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            border: Border.all(color: isError ? Colors.red : Colors.green),
            shape: BoxShape.circle,
          ),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: isError ? Colors.red : Colors.green,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isError ? Icons.close_rounded : Icons.check_rounded,
              color: AppColors.white,
              size: 18,
            ),
          ),
        ),
        const SizedBox(width: 10),
        // message text
        Expanded(
          child: AppText(
            text: message,

            color: AppColors.primary,
            fontSize: 14,
            fontWeight: appMediumFont,
            softWrap: true,
          ),
        ),
      ],
    ),
    showCloseIcon: true,
    closeIconColor: AppColors.primary,
    dismissDirection: DismissDirection.down,
    backgroundColor: AppColors.white,
    behavior: SnackBarBehavior.floating,
    duration: duration ?? const Duration(seconds: 3),
  );

  rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
}
