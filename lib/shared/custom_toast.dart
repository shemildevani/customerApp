
// import '../core/config/config.dart';

// class ToastService {
//   static void show(String message, {ToastType? apiStatus = ToastType.success}) {
//     final isWeb = kIsWeb;

//     BotToast.showAnimationWidget(
//       onlyOne: true,
//       crossPage: true,
//       clickClose: true,
//       duration: const Duration(seconds: 2),
//       animationDuration: const Duration(milliseconds: 300),
//       wrapToastAnimation: (controller, cancel, child) {
//         return isWeb
//             ? SlideTransition(
//               position: Tween<Offset>(
//                 begin: const Offset(1, 0),
//                 end: Offset.zero,
//               ).animate(
//                 CurvedAnimation(parent: controller, curve: Curves.easeOut),
//               ),
//               child: child,
//             )
//             : FadeTransition(opacity: controller, child: child);
//       },
//       toastBuilder:
//           (_) => Align(
//             alignment: isWeb ? Alignment.topRight : Alignment.bottomCenter,
//             child: _buildToast(message, apiStatus, isWeb),
//           ),
//     );
//   }

//   static Widget _buildToast(String message, ToastType? apiStatus, bool isWeb) {
//     return Container(
//       width: kIsWeb ? 450 : double.infinity,
//       padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//       margin:
//           isWeb
//               ? const EdgeInsets.only(top: 40.0, right: 24.0)
//               : const EdgeInsets.only(bottom: 80.0, left: 24.0, right: 24.0),
//       decoration: BoxDecoration(
//         color:
//             apiStatus == ToastType.success
//                 ? AppColors.primary
//                 : apiStatus == ToastType.info
//                 ? AppColors.card
//                 : AppColors.red,
//         borderRadius: BorderRadius.circular(8.0),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 10.0,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(
//             Icons.info,
//             color:
//                 apiStatus == ToastType.success
//                     ? AppColors.white
//                     : apiStatus == ToastType.info
//                     ? AppColors.black
//                     : AppColors.black,
//           ),
//           AppSpacing.w12,
//           Expanded(
//             child: Text(
//               message,
//               style: TextStyle(
//                 fontSize: 16.0,
//                 color:
//                     apiStatus == ToastType.success
//                         ? AppColors.white
//                         : apiStatus == ToastType.info
//                         ? AppColors.black
//                         : AppColors.black,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// enum ToastType { success, fail, info }
