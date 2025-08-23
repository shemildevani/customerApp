// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:customer_app/config/app_color/app_color.dart';
// import 'package:customer_app/config/app_constant/app_assets.dart';
// import 'package:customer_app/config/app_constant/app_font_size.dart';
// import 'package:customer_app/config/app_constant/app_string.dart';
// import 'package:customer_app/config/utils/app_padding.dart';
// import 'package:customer_app/config/utils/app_spacing.dart';
// import 'package:customer_app/screens/data_collection/business_data/business_social_data/business_social_data_cnt.dart';
// import 'package:customer_app/shared/widgets/app_button.dart';
// import 'package:customer_app/shared/widgets/app_textbox.dart';
// import 'package:customer_app/shared/widgets/appbar.dart';
// import 'package:customer_app/shared/widgets/bottom_Navigation_bar/bottom_navigation_screen.dart';
// import 'package:customer_app/shared/widgets/getback.dart';

// class BusinessSocialData extends StatelessWidget {
//   const BusinessSocialData({super.key});

//   @override
//   Widget build(BuildContext context) {
//     BusinessSocialDataCnt cnt = Get.put(BusinessSocialDataCnt());
//     return GestureDetector(
//       onTap: unFocus,
//       child: Scaffold(
//         appBar: buildAppBar(
//           title: AppStringConst.businessSocialData,
//           centerTitle: true,
//         ),
//         body: SafeArea(
//           child: SingleChildScrollView(
//             padding: AppPadding.appPadding,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 IntlPhoneField(
//                   decoration: InputDecoration(
//                     hintText: AppStringConst.phoneNumber,
//                     hintStyle: TextStyle(color: AppColors.grey2),
//                     filled: true,
//                     counterText: AppStringConst.whatsAppNumbertext1,
//                     counterStyle: TextStyle(
//                       color: AppColors.red,
//                       fontSize: AppFontSize.s14,
//                     ),

//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),

//                       borderSide: BorderSide(color: AppColors.grey1),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(color: AppColors.primary),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(color: AppColors.grey1),
//                     ),
//                     counter: Padding(
//                       padding: const EdgeInsets.only(bottom: 10),
//                       child: Text(
//                         AppStringConst.whatsAppNumbertext1,
//                         style: TextStyle(
//                           color: AppColors.primary,
//                           fontSize: AppFontSize.s14,
//                         ),
//                       ),
//                     ),
//                   ),
//                   style: TextStyle(
//                     color: AppColors.black,
//                     fontWeight: appMediumFont,
//                   ),
//                   dropdownTextStyle: TextStyle(
//                     color: AppColors.black,
//                     fontWeight: appMediumFont,
//                   ),

//                   cursorColor: AppColors.primary,
//                   textInputAction: TextInputAction.done,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   initialValue: '+${cnt.countryDialCode.value}',
//                   controller: cnt.phoneNumberController,

//                   onCountryChanged: (value) {
//                     cnt.countryDialCode.value = value.dialCode;
//                   },
//                   invalidNumberMessage: 'Invalid phone number',
//                   validator: (value) {
//                     if (value == null || value.number.isEmpty) {
//                       return 'Please enter a phone number...';
//                     }
//                     return null;
//                   },
//                 ),

//                 AppTextField1(
//                   controller: cnt.emailController,
//                   hintText: AppStringConst.businessEmail,
//                   titleText: AppStringConst.businessEmail,
//                   isRequired: false,
//                   validator: (value) {
//                     if (value != null &&
//                         value.isNotEmpty &&
//                         !GetUtils.isEmail(value)) {
//                       return 'Please enter a valid email';
//                     }
//                     return null;
//                   },
//                 ),
//                 AppSpacing.h10,

//                 AppTextField1(
//                   isRequired: false,
//                   controller: cnt.instagramLinkController,
//                   hintText: AppStringConst.instagramLink,
//                   titleText: AppStringConst.instagramLink,
//                   validator: (value) {
//                     if (value != null && value.isNotEmpty) {
//                       if (!GetUtils.isURL(value)) {
//                         return 'Please enter a valid URL';
//                       }
//                     }
//                     return null;
//                   },
//                 ),

//                 AppSpacing.h10,

//                 AppTextField1(
//                   isRequired: false,
//                   controller: cnt.facebookLinkController,
//                   hintText: AppStringConst.facebookLink,
//                   titleText: AppStringConst.facebookLink,
//                   validator: (value) {
//                     if (value != null && value.isNotEmpty) {
//                       if (!GetUtils.isURL(value)) {
//                         return 'Please enter a valid URL';
//                       }
//                     }
//                     return null;
//                   },
//                 ),
//                 AppSpacing.h10,
//                 AppTextField1(
//                   isRequired: false,
//                   controller: cnt.websiteLinkController,
//                   hintText: AppStringConst.websiteLink,
//                   titleText: AppStringConst.websiteLink,
//                   validator: (value) {
//                     if (value != null && value.isNotEmpty) {
//                       if (!GetUtils.isURL(value)) {
//                         return 'Please enter a valid URL';
//                       }
//                     }
//                     return null;
//                   },
//                 ),

//                 AppSpacing.h20,
//                 Obx(
//                   () => AppButton(
//                     text: AppStringConst.submit,
//                     isLoading: cnt.isLoading.value,

//                     onPressed: () {
//                       Get.offAll(BottomNavigationScreen());
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
