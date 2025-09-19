// 1) Reusable business card
import 'package:customer_app/config/app_color/app_color.dart';
import 'package:customer_app/config/app_constant/app_assets.dart';
import 'package:customer_app/config/app_constant/app_constant.dart';
import 'package:customer_app/config/app_constant/app_font_size.dart';
import 'package:customer_app/config/utils/app_spacing.dart';
import 'package:customer_app/shared/widgets/app_text.dart';
import 'package:customer_app/shared/widgets/business_open_closed_status.dart';
import 'package:flutter/material.dart';

// class BusinessCard extends StatelessWidget {
//   const BusinessCard({
//     super.key,
//     required this.name,
//     required this.category,
//     required this.rating,
//     required this.isOpen,
//     required this.imageProvider,
//     this.onTap,
//   });

//   final String name;
//   final String category;
//   final double rating;
//   final bool isOpen;
//   final ImageProvider imageProvider;
//   final VoidCallback? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(16),
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: AppColors.grey1),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Stack(
//           children: [
//             // Card content
//             Padding(
//               padding: const EdgeInsets.all(12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   AppSpacing.h16,
//                   // Image
//                   Expanded(
//                     child: Container(
//                       height: 84,
//                       width: 84,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                           color: AppColors.primary.withOpacity(0.2),
//                         ),
//                         image: DecorationImage(
//                           image: imageProvider,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                   AppSpacing.h10,

//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         // Name
//                         AppText(
//                           text: 'name name',
//                           maxLines: 2,
//                           overFlow: TextOverflow.ellipsis,
//                           fontSize: AppFontSize.s16,
//                           fontWeight: FontWeight.w600,
//                           textAlign: TextAlign.center,
//                         ),

//                         AppSpacing.h6,

//                         // Category chip
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 8,
//                             vertical: 4,
//                           ),
//                           decoration: BoxDecoration(
//                             // ignore: deprecated_member_use
//                             color: AppColors.primary.withOpacity(0.06),
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: AppText(
//                             text: category,
//                             fontSize: AppFontSize.s12,
//                             color: AppColors.primary,
//                           ),
//                         ),
//                         AppSpacing.h6,

//                         // Rating
// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     const Icon(
//       Icons.star_rounded,
//       size: 18,
//       color: Colors.amber,
//     ),
//     AppSpacing.w4,
//     AppText(
//       text: rating.toStringAsFixed(1),
//       fontSize: AppFontSize.s14,
//       fontWeight: FontWeight.w600,
//     ),
//   ],
// ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // Top-right status badge
//             // Positioned(
//             //   top: 8,
//             //   right: 8,
//             //   child: BusinessOpenClosedStatus(
//             //     isOpen: isOpen,
//             //     fontSize: AppFontSize.s10,
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class BusinessCard extends StatelessWidget {
  const BusinessCard({
    super.key,
    required this.name,
    required this.category,
    required this.rating,
    required this.isOpen,
    required this.imageProvider,
    required this.isFavourite,
    this.onTap,
  });

  final String name;
  final String category;
  final double rating;
  final bool isOpen;
  final bool isFavourite;
  final ImageProvider imageProvider;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  Banner(
                    location: BannerLocation.topStart,
                    message: 'CLOSED',
                    color: Colors.red.shade900,
                    child: Container(
                      height: 84,
                      width: 84,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  AppSpacing.w12,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: 'm2m',
                          textAlign: TextAlign.start,
                          fontSize: AppFontSize.s16,
                          softWrap: true,
                          fontWeight: appBoldFont,
                          maxLines: 1,
                          overFlow: TextOverflow.ellipsis,
                        ),
                        // BusinessOpenClosedStatus(
                        //   isOpen: isOpen,
                        //   fontSize: AppFontSize.s10,
                        // ),
                        AppSpacing.h6,

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.category_outlined,
                              size: 18,
                              color: AppColors.primary,
                            ),
                            AppSpacing.w4,
                            AppText(
                              text: 'Fashion',
                              fontSize: AppFontSize.s12,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        AppSpacing.h6,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              size: 18,
                              color: AppColors.primary,
                            ),
                            AppSpacing.w4,
                            AppText(
                              text: 'Varachha',
                              fontSize: AppFontSize.s12,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        AppSpacing.h6,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              size: 18,
                              color: Colors.amber,
                            ),
                            AppSpacing.w4,
                            AppText(
                              text: rating.toStringAsFixed(1),
                              fontSize: AppFontSize.s12,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),

                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child:
                        isFavourite
                            ? Icon(Icons.favorite, color: Colors.pink)
                            : Icon(Icons.favorite_border_outlined),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
