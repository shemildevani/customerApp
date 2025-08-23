// import 'package:virtueinsight/shared/widgets/shimmer/box.dart';

// import '../../../core/config/config.dart';

// class MemberShimmerItem extends StatelessWidget {
//   const MemberShimmerItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//       margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: const Color(0xff9595A0).withValues(alpha: 0.06),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Shimmer.fromColors(
//             baseColor: Theme.of(context).colorScheme.errorContainer,
//             highlightColor: Theme.of(context).colorScheme.inversePrimary,
//             child: CircleAvatar(
//               radius: 32,
//               backgroundColor: Colors.grey.shade300,
//             ),
//           ),
//           AppSpacing.w10,
//           const Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ShimmerBox(height: 16, width: 100),
//                 SizedBox(height: 8),
//                 ShimmerBox(height: 14, width: 150),
//               ],
//             ),
//           ),
//           AppSpacing.w10,
//           const ShimmerBox(height: 25, width: 70, radius: 4),
//         ],
//       ),
//     );
//   }
// }
