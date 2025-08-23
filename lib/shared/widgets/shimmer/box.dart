// import 'package:virtueinsight/core/config/config.dart';

// class ShimmerBox extends StatelessWidget {
//   final double height;
//   final double? width;
//   final double radius;

//   const ShimmerBox({
//     required this.height,
//     super.key,
//     this.width,
//     this.radius = kBorderRadius,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//       baseColor: Theme.of(context).colorScheme.errorContainer,
//       highlightColor: Theme.of(context).colorScheme.inversePrimary,
//       child: Container(
//         height: height,
//         width: width ?? double.infinity,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(radius),
//         ),
//       ),
//     );
//   }
// }
