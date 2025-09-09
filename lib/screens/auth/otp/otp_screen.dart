import 'package:customer_app/config/app_constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:customer_app/config/app_color/app_color.dart';
import 'package:customer_app/config/app_constant/app_assets.dart';
import 'package:customer_app/config/app_constant/app_font_size.dart';
import 'package:customer_app/config/app_constant/app_string.dart';
import 'package:customer_app/screens/auth/otp/otp_screen_cnt.dart';
import 'package:customer_app/config/utils/app_padding.dart';
import 'package:customer_app/config/utils/app_spacing.dart';
import 'package:customer_app/shared/widgets/app_button.dart';
import 'package:customer_app/shared/widgets/app_text.dart';
import 'package:customer_app/shared/widgets/getback.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // NewPasswordScreenCnt cnt = Get.put(NewPasswordScreenCnt());
    final formKey = GlobalKey<FormState>();
    OtpScreenCnt cnt = Get.put(OtpScreenCnt());

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: AppPadding.authPadding,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SvgPicture.asset(oTPImage),
                  AppSpacing.h16,

                  Obx(() {
                    final sec = cnt.remainingSeconds.value;
                    final minutes = (sec ~/ 60).toString().padLeft(2, '0');
                    final seconds = (sec % 60).toString().padLeft(2, '0');
                    return AppText(
                      text: '$minutes:$seconds',
                      fontSize: AppFontSize.s16,
                      fontWeight: appMediumFont,
                      color: AppColors.primary,
                    );
                  }),
                  AppSpacing.h14,

                  AppText(
                    text: AppStringConst.verify,
                    fontSize: AppFontSize.s24,
                    fontWeight: appBoldFont,
                    color: AppColors.black,
                  ),
                  AppSpacing.h8,
                  AppText(
                    text: AppStringConst.otpSent,
                    fontSize: 12,
                    color: AppColors.grey2,
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                  AppText(
                    text: cnt.maskPhoneNumber('+91 7984941601'),
                    fontSize: AppFontSize.s14,
                    color: AppColors.primary,
                    fontWeight: appBoldFont,
                  ),
                  AppSpacing.h24,
                  Align(
                    alignment: Alignment.center,
                    child: OtpTextField(
                      cursorColor: AppColors.primary,
                      keyboardType: TextInputType.number,
                      focusedBorderColor: AppColors.primary,
                      showFieldAsBox: true,

                      textStyle: TextStyle(
                        fontSize: AppFontSize.s16,
                        fontWeight: appMediumFont,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      numberOfFields: 6,
                      onSubmit: (value) {
                        // cnt.otp.value = value;
                      },
                      autoFocus: false,
                    ),
                  ),

                  AppSpacing.h4,
                  Obx(() {
                    return TextButton(
                      onPressed:
                          cnt.remainingSeconds.value == 0
                              ? () {
                                // call resend here
                                cnt.resetTimer();
                                // e.g. cnt.reSendOtp(email);
                              }
                              : null, // disabled while timer > 0
                      child: Text(
                        cnt.remainingSeconds.value == 0
                            ? AppStringConst.resendCode
                            : AppStringConst.resendCode,
                        style: TextStyle(
                          color:
                              cnt.remainingSeconds.value == 0
                                  ? AppColors.primary
                                  : Colors.grey, // grey when disabled
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    );
                  }),

                  AppSpacing.h24,

                  Obx(
                    () => AppButton(
                      isLoading: cnt.isLoading.value,
                      text: AppStringConst.verifyCode,
                      onPressed: () {
                        unFocus();
                        cnt.optVerifyFunc();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
