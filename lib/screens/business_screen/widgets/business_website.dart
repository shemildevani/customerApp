import 'package:customer_app/config/app_color/app_color.dart';
import 'package:customer_app/config/app_constant/app_constant.dart';
import 'package:customer_app/config/app_constant/app_font_size.dart';
import 'package:customer_app/config/utils/app_spacing.dart';
import 'package:customer_app/shared/widgets/app_text.dart';
import 'package:flutter/material.dart';

class BusinessWebsiteCard extends StatelessWidget {
  final String url;

  const BusinessWebsiteCard({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: AppColors.black.withOpacity(0.06),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: 'Business Website',
              fontWeight: appBoldFont,
              fontSize: AppFontSize.s18,
            ),
            AppSpacing.h10,
      
            // Pretty URL pill
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: AppColors.grey1.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
                // ignore: deprecated_member_use
                border: Border.all(color: AppColors.grey1.withOpacity(0.5)),
              ),
              child: Row(
                children: [
                  Icon(Icons.public, size: 18, color: AppColors.grey2),
                  AppSpacing.w8,
                  Expanded(
                    child: AppText(
                      text: url,
                      fontSize: AppFontSize.s14,
                      color: AppColors.black,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  AppSpacing.w8,
                  // Visit button
                  Material(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {}, // UI only
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        child: AppText(
                          text: 'Visit',
                          color: AppColors.white,
                          fontSize: AppFontSize.s14,
                          fontWeight: appBoldFont,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      
          
          ],
        ),
      ),
    );
  }
}

