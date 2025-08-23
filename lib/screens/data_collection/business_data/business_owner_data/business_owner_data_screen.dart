// import 'package:dotted_line/dotted_line.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:customer_app/config/app_color/app_color.dart';
// import 'package:customer_app/config/app_constant/app_assets.dart';
// import 'package:customer_app/config/app_constant/app_font_size.dart';
// import 'package:customer_app/config/app_constant/app_string.dart';
// import 'package:customer_app/config/utils/app_padding.dart';
// import 'package:customer_app/config/utils/app_spacing.dart';
// import 'package:customer_app/screens/data_collection/business_data/business_contact_data/business_address_data_screen.dart';
// import 'package:customer_app/screens/data_collection/business_data/business_owner_data/business_owner_data_screen_cnt.dart';
// import 'package:customer_app/shared/widgets/app_button.dart';
// import 'package:customer_app/shared/widgets/app_text.dart';
// import 'package:customer_app/shared/widgets/app_textbox.dart';
// import 'package:customer_app/shared/widgets/appbar.dart';
// import 'package:customer_app/shared/widgets/unfocus.dart';

// class BusinessOwnerDataScreen extends StatelessWidget {
//   const BusinessOwnerDataScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cnt = Get.put(BusinessOwnerDataScreenCnt());

//     return GestureDetector(
//       onTap: unFocus,
//       child: Scaffold(
//         appBar: buildAppBar(
//           title: AppStringConst.businessOwnerData,
//           centerTitle: true,
//         ),
//         body: SafeArea(
//           child: Padding(
//             padding: AppPadding.appPadding,
//             child: Obx(() {
//               return SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // ==== Owners list ====
//                     ...List.generate(cnt.owners.length, (index) {
//                       final b = cnt.owners[index];
//                       return Padding(
//                         padding: EdgeInsets.only(
//                           bottom: index == cnt.owners.length - 1 ? 0 : 16,
//                         ),
//                         child: Form(
//                           key: b.formKey,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               // Header with dotted lines and index
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: DottedLine(
//                                       dashColor: AppColors.primary,
//                                     ),
//                                   ),
//                                   AppSpacing.w12,
//                                   AppText(
//                                     text: 'Owner ${index + 1}',
//                                     color: AppColors.primary,
//                                     fontSize: AppFontSize.s14,
//                                     fontWeight: appMediumFont,
//                                   ),
//                                   AppSpacing.w12,
//                                   Expanded(
//                                     child: DottedLine(
//                                       dashColor: AppColors.primary,
//                                     ),
//                                   ),
//                                   // Remove button (keep at least one)
//                                   AppSpacing.w8,
//                                   if (cnt.owners.length > 1)
//                                     IconButton(
//                                       tooltip: 'Remove owner',
//                                       onPressed: () => cnt.removeOwner(index),
//                                       icon: Icon(
//                                         Icons.remove_circle_outline,
//                                         color: AppColors.error,
//                                       ),
//                                     ),
//                                 ],
//                               ),

//                               AppTextField1(
//                                 controller: b.firstName,
//                                 titleText: AppStringConst.firstName,
//                                 hintText: AppStringConst.firstName,
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter your first name';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                               AppSpacing.h10,
//                               AppTextField1(
//                                 controller: b.lastName,
//                                 titleText: AppStringConst.lastName,
//                                 hintText: AppStringConst.lastName,
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter your last name';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                               AppSpacing.h10,
//                               IntlPhoneField(
//                                 decoration: InputDecoration(
//                                   hintText: AppStringConst.phoneNumber,
//                                   hintStyle: TextStyle(color: AppColors.grey2),
//                                   filled: true,
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       color: AppColors.grey1,
//                                     ),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       color: AppColors.primary,
//                                     ),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       color: AppColors.grey1,
//                                     ),
//                                   ),
//                                 ),
//                                 style: TextStyle(
//                                   color: AppColors.black,
//                                   fontWeight: appMediumFont,
//                                 ),
//                                 dropdownTextStyle: TextStyle(
//                                   color: AppColors.black,
//                                   fontWeight: appMediumFont,
//                                 ),
//                                 cursorColor: AppColors.primary,
//                                 textInputAction: TextInputAction.done,
//                                 autovalidateMode:
//                                     AutovalidateMode.onUserInteraction,
//                                 controller: b.phone,
//                                 initialCountryCode:
//                                     b
//                                         .countryDialCode
//                                         .value, // will auto-pick if matches ISO
//                                 onCountryChanged: (value) {
//                                   b.countryDialCode.value = value.dialCode;
//                                 },
//                                 invalidNumberMessage: 'Invalid phone number',
//                                 validator: (value) {
//                                   if (value == null || value.number.isEmpty) {
//                                     return 'Please enter a phone number...';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                               AppSpacing.h10,

//                               AppTextField1(
//                                 controller: b.email,
//                                 titleText: AppStringConst.email,
//                                 hintText: AppStringConst.email,
//                                 isRequired: false,
//                                 validator: (value) {
//                                   if (value != null &&
//                                       !GetUtils.isEmail(value)) {
//                                     return 'Please enter a valid email';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                               AppSpacing.h10,
//                               AppTextField1(
//                                 controller: b.city,
//                                 titleText: AppStringConst.city,
//                                 hintText: AppStringConst.city,
//                                 isRequired: true,
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter your city';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                               AppSpacing.h10,
//                               AppTextField1(
//                                 controller: b.state,
//                                 titleText: AppStringConst.state,
//                                 hintText: AppStringConst.state,
//                                 isRequired: true,
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter your state';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                               AppSpacing.h10,
//                               AppTextField1(
//                                 controller: b.pincode,
//                                 titleText: AppStringConst.pincode,
//                                 hintText: AppStringConst.pincode,
//                                 isRequired: true,
//                                 keyboardType: TextInputType.number,
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter your pincode';
//                                   }
//                                   if (!GetUtils.isNumericOnly(value)) {
//                                     return 'Please enter a valid pincode';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                               AppSpacing.h16,
//                             ],
//                           ),
//                         ),
//                       );
//                     }),

//                     // ==== Add owner button ====
//                     Align(
//                       alignment: Alignment.center,
//                       child: TextButton(
//                         onPressed: cnt.addOwner,
//                         child: AppText(
//                           text: AppStringConst.addOwner,
//                           color: AppColors.primary,
//                           fontSize: AppFontSize.s16,
//                           fontWeight: appMediumFont,
//                         ),
//                       ),
//                     ),

//                     AppSpacing.h24,

//                     // ==== Save ====
//                     AppButton(
//                       text: AppStringConst.save,
//                       onPressed: () {
//                         // cnt.saveAll();
//                         Get.to(BusinessAddressDataScreen());
//                       },
//                     ),
//                   ],
//                 ),
//               );
//             }),
//           ),
//         ),
//       ),
//     );
//   }
// }
