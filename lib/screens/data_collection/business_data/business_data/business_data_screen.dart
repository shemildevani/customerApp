// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:customer_app/config/app_color/app_color.dart';
// import 'package:customer_app/config/app_constant/app_assets.dart';
// import 'package:customer_app/config/app_constant/app_enum.dart';
// import 'package:customer_app/config/app_constant/app_font_size.dart';
// import 'package:customer_app/config/app_constant/app_string.dart';
// import 'package:customer_app/config/utils/app_padding.dart';
// import 'package:customer_app/config/utils/app_spacing.dart';
// import 'package:customer_app/screens/data_collection/business_data/business_data/business_data_cnt.dart';
// import 'package:customer_app/shared/widgets/app_button.dart';
// import 'package:customer_app/shared/widgets/app_text.dart';
// import 'package:customer_app/shared/widgets/app_textbox.dart';
// import 'package:customer_app/shared/widgets/appbar.dart';
// import 'package:customer_app/shared/widgets/custom_drop_down_button.dart';
// import 'package:customer_app/shared/widgets/unfocus.dart';

// class ShopDataFirstScreen extends StatefulWidget {
//   const ShopDataFirstScreen({super.key});

//   @override
//   State<ShopDataFirstScreen> createState() => _ShopDataFirstScreenState();
// }

// class _ShopDataFirstScreenState extends State<ShopDataFirstScreen> {
//   BusinessDataCnt cnt = Get.put(BusinessDataCnt());

//   List<String> openingTime = [
//     '6:00 AM',
//     '6:30 AM',
//     '7:00 AM',
//     '7:30 AM',
//     '8:00 AM',
//     '8:30 AM',
//     '9:00 AM',
//     '9:30 AM',
//     '10:00 AM',
//     '10:30 AM',
//     '11:00 AM',
//     '11:30 AM',
//     "12:00 PM",
//   ];

//   List<String> closingTime = [
//     '6:00 PM',
//     '6:30 PM',
//     '7:00 PM',
//     '7:30 PM',
//     '8:00 PM',
//     '8:30 PM',
//     '9:00 PM',
//     '9:30 PM',
//     '10:00 PM',
//     '10:30 PM',
//     '11:00 PM',
//     '11:30 PM',
//     "12:00 AM",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: unFocus,
//       child: Scaffold(
//         appBar: buildAppBar(
//           title: AppStringConst.businessData,
//           centerTitle: true,
//         ),
//         body: SafeArea(
//           child: Padding(
//             padding: AppPadding.appPadding,
//             child: SingleChildScrollView(
//               child: Form(
//                 key: cnt.formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     // shop image section
//                     Obx(
//                       () => Container(
//                         height: 130,
//                         width: 130,
//                         padding: EdgeInsets.all(2),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                             color: AppColors.primary,
//                             width: 2,
//                           ),
//                         ),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             image: DecorationImage(
//                               image:
//                                   cnt.shopLogoFile.value != null
//                                       ? FileImage(cnt.shopLogoFile.value!)
//                                       : AssetImage(shopImage) as ImageProvider,
//                               fit: BoxFit.contain,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     AppSpacing.h14,
//                     TextButton(
//                       onPressed: () {
//                         cnt.pickShopLogo();
//                       },
//                       child: AppText(
//                         text: AppStringConst.edit,
//                         color: AppColors.primary,
//                         fontSize: AppFontSize.s16,
//                         fontWeight: appMediumFont,
//                       ),
//                     ),

//                     // shop name section
//                     AppSpacing.h10,
//                     AppTextField1(
//                       controller: cnt.businessNameCnt,
//                       hintText: AppStringConst.businessName,
//                       titleText: AppStringConst.businessName,
//                       isRequired: true,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your business name';
//                         }
//                         return null;
//                       },
//                     ),

//                     // shop GST number section
//                     AppSpacing.h10,
//                     AppTextField1(
//                       controller: cnt.gstNoCnt,
//                       hintText: AppStringConst.businessGSTNo,
//                       titleText: AppStringConst.businessGSTNo,
//                       isRequired: true,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your GST number';
//                         }
//                         return null;
//                       },
//                     ),

//                     // business type dropdown
//                     AppSpacing.h14,
//                     AddDropDownButton(
//                       hintText: AppStringConst.selectBusinessType,
//                       validator: (p0) {
//                         if (p0 == null || p0.isEmpty) {
//                           return 'Please select a business type';
//                         }
//                         return null;
//                       },
//                       items: BusinessType.values.map((e) => e.name).toList(),
//                       onChanged: (p0) {
//                         cnt.businessType.value = p0!;
//                       },
//                     ),

//                     // shop category dropdown
//                     AppSpacing.h14,
//                     AddDropDownButton(
//                       hintText: AppStringConst.selectbusinessCategory,
//                       validator: (p0) {
//                         if (p0 == null || p0.isEmpty) {
//                           return 'Please select a business category';
//                         }
//                         return null;
//                       },
//                       items: ShopCategories.values.map((e) => e.name).toList(),
//                       onChanged: (p0) {
//                         cnt.businessCategory.value = p0!;
//                       },
//                     ),

//                     AppSpacing.h14,

//                     AddDropDownButton(
//                       hintText: AppStringConst.selectopenTime,
//                       validator: (p0) {
//                         if (p0 == null || p0.isEmpty) {
//                           return 'Please select a Opening Time';
//                         }
//                         return null;
//                       },
//                       items: openingTime.toList(),
//                       onChanged: (p0) {
//                         cnt.openTimeCnt.text = p0!;
//                       },
//                     ),
//                     AppSpacing.h14,

//                     AddDropDownButton(
//                       hintText: AppStringConst.selectcloseTime,
//                       validator: (p0) {
//                         if (p0 == null || p0.isEmpty) {
//                           return 'Please select a Closing Time';
//                         }
//                         return null;
//                       },
//                       items: closingTime.toList(),
//                       onChanged: (p0) {
//                         cnt.closeTimeCnt.text = p0!;
//                       },
//                     ),

//                     // description field
//                     AppSpacing.h14,
//                     AppTextField1(
//                       controller: cnt.descriptionCnt,
//                       hintText: AppStringConst.businessDescription,
//                       titleText: AppStringConst.businessDescription,
//                       isRequired: true,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter a description';
//                         }
//                         return null;
//                       },
//                     ),

//                     // save button
//                     AppSpacing.h20,
//                     AppButton(
//                       text: 'Save',
//                       onPressed: () {
//                         cnt.saveData();
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:customer_app/config/app_color/app_color.dart';
// // import 'package:customer_app/config/app_constant/app_font_size.dart';
// // import 'package:customer_app/config/utils/app_spacing.dart';
// // import 'package:customer_app/shared/widgets/app_button.dart';
// // import 'package:customer_app/shared/widgets/app_text.dart';
// // import 'business_select_cnt.dart';
// // import 'package:customer_app/config/constants/app_business_types.dart';
// // import 'package:customer_app/config/constants/app_seller_categories.dart';

// // class BusinessSelectView extends StatelessWidget {
// //   const BusinessSelectView({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     final cnt = Get.put(BusinessSelectCnt());

// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Business Setup')),
// //       body: SafeArea(
// //         child: SingleChildScrollView(
// //           padding: const EdgeInsets.all(16),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               const AppText(
// //                 text: 'Select Business Type',
// //                 fontSize: AppFontSize.s18,
// //                 fontWeight: FontWeight.w700,
// //                 color: AppColors.black,
// //                 textAlign: TextAlign.left,
// //               ),
// //               AppSpacing.h12,

// //               // Business Type chips
// //               Obx(() {
// //                 return Wrap(
// //                   spacing: 10,
// //                   runSpacing: 10,
// //                   children: AppBusinessTypes.all.map((t) {
// //                     final selected = cnt.selectedBusinessType.value == t;
// //                     return ChoiceChip(
// //                       label: Text(t),
// //                       selected: selected,
// //                       onSelected: (_) => cnt.setType(t),
// //                       selectedColor: AppColors.primary.withValues(alpha: .12),
// //                       labelStyle: TextStyle(
// //                         fontSize: AppFontSize.s14,
// //                         fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
// //                         color: selected ? AppColors.primary : AppColors.black,
// //                       ),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(10),
// //                         side: BorderSide(
// //                           color: selected ? AppColors.primary : AppColors.grey1,
// //                         ),
// //                       ),
// //                       backgroundColor: Colors.white,
// //                     );
// //                   }).toList(),
// //                 );
// //               }),

// //               AppSpacing.h24,
// //               const AppText(
// //                 text: 'Select Categories (Top 8)',
// //                 fontSize: AppFontSize.s18,
// //                 fontWeight: FontWeight.w700,
// //                 color: AppColors.black,
// //                 textAlign: TextAlign.left,
// //               ),
// //               AppSpacing.h12,

// //               // Categories chips
// //               Obx(() {
// //                 return Wrap(
// //                   spacing: 10,
// //                   runSpacing: 10,
// //                   children: AppSellerCategories.top8.map((c) {
// //                     final selected = cnt.isSelected(c);
// //                     return FilterChip(
// //                       label: Text(c),
// //                       selected: selected,
// //                       onSelected: (_) => cnt.toggleCategory(c),
// //                       selectedColor: AppColors.primary.withValues(alpha: .12),
// //                       checkmarkColor: AppColors.primary,
// //                       labelStyle: TextStyle(
// //                         fontSize: AppFontSize.s14,
// //                         fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
// //                         color: selected ? AppColors.primary : AppColors.black,
// //                       ),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(10),
// //                         side: BorderSide(
// //                           color: selected ? AppColors.primary : AppColors.grey1,
// //                         ),
// //                       ),
// //                       backgroundColor: Colors.white,
// //                     );
// //                   }).toList(),
// //                 );
// //               }),

// //               AppSpacing.h24,
// //               Obx(() => AppText(
// //                     text:
// //                         'Selected: ${cnt.selectedBusinessType.value} • ${cnt.selectedCategories.join(', ')}',
// //                     fontSize: AppFontSize.s14,
// //                     color: AppColors.grey2,
// //                     textAlign: TextAlign.left,
// //                   )),
// //               AppSpacing.h24,

// //               // Continue button
// //               AppButton(
// //                 text: 'Continue',
// //                 onPressed: () {
// //                   // TODO: save to D1 / move next
// //                   // print(cnt.selectedBusinessType.value);
// //                   // print(cnt.selectedCategories.toList());
// //                   Navigator.of(context).pop();
// //                 },
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
