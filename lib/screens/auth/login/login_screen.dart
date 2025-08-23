import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:customer_app/config/app_color/app_color.dart';
import 'package:customer_app/config/app_constant/app_assets.dart';
import 'package:customer_app/config/app_constant/app_font_size.dart';
import 'package:customer_app/config/app_constant/app_string.dart';
import 'package:customer_app/screens/auth/login/login_screen_cnt.dart';
import 'package:customer_app/config/utils/app_padding.dart';
import 'package:customer_app/config/utils/app_spacing.dart';
import 'package:customer_app/shared/widgets/app_button.dart';
import 'package:customer_app/shared/widgets/app_text.dart';
import 'package:customer_app/shared/widgets/unfocus.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cnt = Get.put(LoginScreenCnt());
    final formKey = GlobalKey<FormState>();
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: unFocus,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: AppPadding.authPadding,
              child: Obx(
                () => Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(loginImage),

                      AppSpacing.h14,
                      Align(
                        alignment: Alignment.center,
                        child: AppText(
                          text: AppStringConst.login,
                          fontSize: AppFontSize.s24,
                          fontWeight: appBoldFont,
                        ),
                      ),
                      AppSpacing.h14,

                      AppText(
                        text: AppStringConst.login1,
                        fontSize: 14,
                        color: AppColors.grey2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                      AppSpacing.h14,
                      // Phone number only
                      IntlPhoneField(
                        decoration: InputDecoration(
                          hintText: AppStringConst.phoneNumber,
                          hintStyle: TextStyle(color: theme.hintColor),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),

                            borderSide: BorderSide(color: AppColors.grey1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: AppColors.primary),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: AppColors.grey1),
                          ),
                        ),
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: appMediumFont,
                        ),
                        dropdownTextStyle: TextStyle(
                          color: AppColors.black,
                          fontWeight: appMediumFont,
                        ),

                        cursorColor: AppColors.primary,
                        textInputAction: TextInputAction.done,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        initialValue: '+${cnt.countryDialCode.value}',
                        controller: cnt.phoneNumberController,

                        onCountryChanged: (value) {
                          cnt.countryDialCode.value = value.dialCode;
                        },
                        invalidNumberMessage: 'Invalid phone number',
                        validator: (value) {
                          if (value == null || value.number.isEmpty) {
                            return 'Please enter a phone number...';
                          }
                          return null;
                        },
                      ),

                      AppSpacing.h24,
                      Obx(
                        () => AppButton(
                          text: AppStringConst.getOTP,
                          isLoading: cnt.isLoading.value,

                          onPressed: () {
                            if (cnt.isLoading.value) {
                              null;
                            } else {
                              if (formKey.currentState!.validate()) {
                                cnt.getOTP();
                              }
                            }
                          },
                        ),
                      ),
                      AppSpacing.h14,

                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                            height: 1.4,
                          ),
                          children: [
                            const TextSpan(
                              style: TextStyle(fontSize: 12),
                              text:
                                  "By tapping Send OTP via WhatsApp, you agree to our ",
                            ),
                            TextSpan(
                              text: "Terms & Conditions",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                                decoration: TextDecoration.underline,
                              ),
                              // recognizer: TapGestureRecognizer()
                              //   ..onTap = () => launchUrl(Uri.parse("https://yourdomain.com/terms")),
                            ),
                            const TextSpan(text: " and "),
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                                decoration: TextDecoration.underline,
                              ),
                              // recognizer: TapGestureRecognizer()
                              //   ..onTap = () => launchUrl(Uri.parse("https://yourdomain.com/privacy")),
                            ),
                            const TextSpan(text: "."),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // InputDecoration inputDecoration({
  //   required String hint,
  //   required IconData icon,

  //   Widget? suffixIcon,
  // }) => InputDecoration(
  //   hintText: hint,
  //   hintStyle: TextStyle(color: appGreyColor),
  //   filled: true,
  //   fillColor: appGrey900ShadeColor,
  //   border: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(12),
  //     borderSide: BorderSide.none,
  //   ),
  //   suffixIcon: suffixIcon,
  //   errorMaxLines: 2,
  //   prefixIcon: Icon(icon, color: appGreyColor),
  // );
}
