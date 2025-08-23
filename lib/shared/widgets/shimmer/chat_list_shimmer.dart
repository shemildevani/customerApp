// import 'package:virtueinsight/core/config/config.dart';

// class ChatListShimmer extends StatelessWidget {
//   const ChatListShimmer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: 8,
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),

//       itemBuilder: (_, __) {
//         return Container(
//           decoration: borderDecoration(context, radius: 14),
//           margin: const EdgeInsets.only(bottom: 10),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//             child: Shimmer.fromColors(
//               baseColor: Theme.of(context).colorScheme.errorContainer,
//               highlightColor: Theme.of(context).colorScheme.inversePrimary,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: 60,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                   AppSpacing.w12,
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           width: double.infinity,
//                           height: 12,
//                           color: Colors.white,
//                         ),
//                         AppSpacing.h8,
//                         Container(
//                           width: double.infinity,
//                           height: 12,
//                           color: Colors.white,
//                         ),
//                         AppSpacing.h8,
//                         Container(width: 100, height: 12, color: Colors.white),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

