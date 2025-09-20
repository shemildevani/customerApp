import 'package:customer_app/config/app_color/app_color.dart';
import 'package:customer_app/config/utils/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NotificationShimmerList extends StatelessWidget {
  const NotificationShimmerList({super.key, this.itemCount = 6});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount,
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, __) => const ShimmerNotificationTile(),
    );
  }
}

class ShimmerNotificationTile extends StatelessWidget {
  const ShimmerNotificationTile({super.key});

  @override
  Widget build(BuildContext context) {
    final base = Colors.grey.shade300;
    final highlight = Colors.grey.shade100;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: AppColors.black.withOpacity(0.06),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
        // ignore: deprecated_member_use
        border: Border.all(color: AppColors.appBgColor.withOpacity(0.3)),
      ),
      child: Shimmer.fromColors(
        baseColor: base,
        highlightColor: highlight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Leading avatar circle placeholder
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(color: base, shape: BoxShape.circle),
            ),
            AppSpacing.w12,

            // Text area placeholders
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title line
                  Container(
                    height: 18,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: base,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  AppSpacing.h8,
                  // Subline with shop • date (three short pills)
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          height: 14,
                          decoration: BoxDecoration(
                            color: base,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                    ],
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
