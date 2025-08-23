// import 'package:virtueinsight/core/config/config.dart';
// import 'package:virtueinsight/shared/widgets/shimmer/box.dart';

// class EventShimmerItem extends StatelessWidget {
//   const EventShimmerItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;

//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Shimmer.fromColors(
//             baseColor: Theme.of(context).colorScheme.errorContainer,
//             highlightColor: Theme.of(context).colorScheme.inversePrimary,
//             child: Container(
//               height:
//                   RH.isTablet(context)
//                       ? RH.h(context) * 0.35
//                       : RH.h(context) * 0.22,
//               width: RH.w(context),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//           ),
//           AppSpacing.h10,
//           ShimmerBox(height: 18, width: width * 0.4),
//           AppSpacing.h6,
//           ShimmerBox(height: 16, width: width * 0.5),
//           AppSpacing.h6,
//           ShimmerBox(height: 16, width: width * 0.7),
//         ],
//       ),
//     );
//   }
// }
