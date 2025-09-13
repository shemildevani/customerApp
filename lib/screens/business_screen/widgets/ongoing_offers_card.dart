// --- Ongoing Offers Section (UI only) ---
// ignore_for_file: deprecated_member_use

import 'package:customer_app/config/app_color/app_color.dart';
import 'package:flutter/material.dart';

// class OngoingOffersSection extends StatelessWidget {
//   const OngoingOffersSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: AppColors.black.withOpacity(0.06),
//             blurRadius: 14,
//             offset: const Offset(0, 6),
//           ),
//         ],
//       ),
//       padding: const EdgeInsets.all(12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Header
//           Row(
//             children: [
//               Expanded(
//                 child: AppText(
//                   text: 'Ongoing Offers',
//                   fontWeight: appBoldFont,
//                   fontSize: AppFontSize.s18,
//                 ),
//               ),
//               Material(
//                 color: AppColors.transparent,
//                 child: InkWell(
//                   borderRadius: BorderRadius.circular(8),
//                   onTap: () {}, // TODO: See all
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 8,
//                       vertical: 6,
//                     ),
//                     child: AppText(
//                       text: 'See all',
//                       color: AppColors.primary,
//                       fontSize: AppFontSize.s14,
//                       fontWeight: appBoldFont,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           AppSpacing.h12,

//           // Cards carousel
//           SizedBox(
//             height: 130,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: 3, // static demo
//               itemBuilder: (context, index) {
//                 return _OfferCard(
//                   title: 'Summer Sale ${index + 1}',
//                   subtitle: 'Flat 30% OFF on all T-Shirts',
//                   discountText: '30% OFF',
//                   validText: 'Valid till 30 Sep',
//                   imageAsset: 'assets/images/banner.jpg', // replace per item
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class OfferCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String discountText;
  final String validText;
  final String imageAsset;

  const OfferCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.discountText,
    required this.validText,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.grey1.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),

        image: DecorationImage(
          image: AssetImage('assets/images/offer.jpg'),
          fit: BoxFit.contain,
        ),
        border: Border.all(color: AppColors.grey1.withOpacity(0.5)),
      ),
    );
  }
}
