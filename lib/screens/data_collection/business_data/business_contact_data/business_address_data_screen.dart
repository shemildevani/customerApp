// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:customer_app/config/app_constant/app_string.dart';
// import 'package:customer_app/screens/data_collection/business_data/business_contact_data/business_address_data_screen_cnt.dart';
// import 'package:customer_app/config/utils/app_padding.dart';
// import 'package:customer_app/config/utils/app_spacing.dart';
// import 'package:customer_app/screens/data_collection/business_data/business_social_data/business_social_data.dart';
// import 'package:customer_app/shared/widgets/app_button.dart';
// import 'package:customer_app/shared/widgets/app_textbox.dart';
// import 'package:customer_app/shared/widgets/appbar.dart';
// import 'package:customer_app/shared/widgets/getback.dart';

// class BusinessAddressDataScreen extends StatelessWidget {
//   const BusinessAddressDataScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     BusinessAddressDataScreenCnt cnt = Get.put(BusinessAddressDataScreenCnt());
//     return GestureDetector(
//       onTap: unFocus,
//       child: Scaffold(
//         appBar: buildAppBar(
//           title: AppStringConst.businessAddressData,
//           centerTitle: true,
//         ),
//         body: SafeArea(
//           child: SingleChildScrollView(
//             padding: AppPadding.appPadding,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 AppTextField1(
//                   controller: cnt.addressLine1Controller,
//                   hintText: AppStringConst.addressLine1,
//                   titleText: AppStringConst.addressLine1,
//                   isRequired: true,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your address line 1';
//                     }
//                     return null;
//                   },
//                 ),
//                 AppSpacing.h10,
//                 AppTextField1(
//                   controller: cnt.addressLine2Controller,
//                   hintText: AppStringConst.addressLine2,
//                   titleText: AppStringConst.addressLine2,
//                   isRequired: false,
//                 ),

//                 AppSpacing.h10,
//                 AppTextField1(
//                   controller: cnt.cityController,
//                   hintText: AppStringConst.city,
//                   titleText: AppStringConst.city,
//                   isRequired: true,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your city';
//                     }
//                     return null;
//                   },
//                 ),
//                 AppSpacing.h10,
//                 AppTextField1(
//                   controller: cnt.stateController,
//                   hintText: AppStringConst.state,
//                   titleText: AppStringConst.state,
//                   isRequired: true,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your state';
//                     }
//                     return null;
//                   },
//                 ),
//                 AppSpacing.h10,
//                 AppTextField1(
//                   controller: cnt.pincodeController,
//                   hintText: AppStringConst.pincode,
//                   titleText: AppStringConst.pincode,
//                   isRequired: true,
//                   keyboardType: TextInputType.number,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your pincode';
//                     }
//                     if (!GetUtils.isNumericOnly(value)) {
//                       return 'Please enter a valid pincode';
//                     }
//                     return null;
//                   },
//                 ),

//                 AppSpacing.h10,
//                 AppTextField1(
//                   isRequired: false,

//                   controller: cnt.googleMapURLController,
//                   hintText: AppStringConst.googleMapUrl,
//                   titleText: AppStringConst.googleMapUrl,
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

//                 AppSpacing.h20,
//                 Obx(
//                   () => AppButton(
//                     text: AppStringConst.submit,
//                     isLoading: cnt.isLoading.value,

//                     onPressed: () {
//                       Get.to(BusinessSocialData());
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
