// import 'package:virtueinsight/shared/widgets/shimmer/box.dart';

// import '../../../core/config/config.dart';

// class ChatImageShimmerItem extends StatelessWidget {
//   final bool? isSender;
//   const ChatImageShimmerItem({required this.isSender, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment:
//           isSender ?? false ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 8),
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: Colors.grey.shade300,
//           borderRadius: BorderRadius.only(
//             topLeft: const Radius.circular(12),
//             topRight: const Radius.circular(12),
//             bottomLeft: Radius.circular(isSender ?? false ? 12 : 0),
//             bottomRight: Radius.circular(isSender ?? false ? 0 : 12),
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment:
//               isSender ?? false
//                   ? CrossAxisAlignment.end
//                   : CrossAxisAlignment.start,
//           children: const [
//             ShimmerBox(height: 200, radius: 8, width: 200),
//             AppSpacing.h6,
//             ShimmerBox(height: 12, width: 60),
//           ],
//         ),
//       ),
//     );
//   }
// }
