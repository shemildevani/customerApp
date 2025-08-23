

// import 'package:virtueinsight/shared/widgets/shimmer/box.dart';

// import '../../../core/config/config.dart';

// class ChatMessageShimmerItem extends StatelessWidget {
//   final bool isSender;
//   const ChatMessageShimmerItem({required this.isSender, super.key});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;

//     return Align(
//       alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 8),
//         padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//         constraints: BoxConstraints(maxWidth: width * 0.7),
//         decoration: BoxDecoration(
//           color: Colors.grey.shade300,
//           borderRadius: BorderRadius.only(
//             topLeft: const Radius.circular(12),
//             topRight: const Radius.circular(12),
//             bottomLeft: Radius.circular(isSender ? 12 : 0),
//             bottomRight: Radius.circular(isSender ? 0 : 12),
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment:
//           isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//           children: [
//             ShimmerBox(height: 14, width: width * 0.5),
//             AppSpacing.h6,
//             const ShimmerBox(height: 10, width: 40),
//           ],
//         ),
//       ),
//     );
//   }
// }