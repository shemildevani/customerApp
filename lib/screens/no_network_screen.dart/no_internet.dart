// import 'package:customer_app/screens/no_network_screen.dart/no_netwrok_screen_cnt.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class NoInternetConnectionScreen extends StatelessWidget {
//   const NoInternetConnectionScreen({super.key, required this.onPressed});
//   final VoidCallback onPressed;

//   @override
//   Widget build(BuildContext context) {
//     final NoInternetConnectionScreenCnt controller =
//         Get.find<NoInternetConnectionScreenCnt>();

//     return Scaffold(
//       backgroundColor: whiteColor,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0),
//           child: Obx(() => Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(
//                     Icons.wifi_off,
//                     size: 100,
//                     color: Colors.grey,
//                   ),
//                   AppWidget.hightBox(height: 24),
//                   AppText(
//                     text: 'No Internet Connection',
//                     fontSize: appFontSize28,
//                     fontWeight: FontWeight.bold,
//                     textAlign: TextAlign.center,
//                     softWrap: true,
//                   ),
//                   AppWidget.hightBox(height: 12),
//                   AppText(
//                     text:
//                         'Please check your internet connection and try again.',
//                     fontSize: appFontSize16,
//                     color: appGreyShadeColor,
//                     textAlign: TextAlign.center,
//                     softWrap: true,
//                   ),
//                   AppWidget.hightBox(height: 30),
//                   controller.isLoading.value
//                       ? const CircularProgressIndicator()
//                       : ElevatedButton.icon(
//                           onPressed: controller.isConnected.value
//                               ? () async {
//                                   onPressed();
//                                 }
//                               : null,
//                           icon: Icon(
//                             Icons.refresh,
//                             size: 28,
//                             color: whiteColor,
//                           ),
//                           label: AppText(
//                             text: controller.isConnected.value
//                                 ? 'Retry'
//                                 : 'No Internet Connection',
//                             fontSize: appFontSize16,
//                             color: whiteColor,
//                             fontWeight: appBoldFont,
//                             softWrap: true,
//                           ),
//                           style: ElevatedButton.styleFrom(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 32, vertical: 14),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             disabledBackgroundColor: appGreyShadeColor,
//                             backgroundColor: appPrimaryColor,
//                             foregroundColor: whiteColor,
//                           ),
//                         ),
//                 ],
//               )),
//         ),
//       ),
//     );
//   }
// }
