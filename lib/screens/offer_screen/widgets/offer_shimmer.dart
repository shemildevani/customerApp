import 'package:customer_app/config/app_color/app_color.dart';
import 'package:customer_app/config/utils/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class OfferShimmer extends StatelessWidget {
  const OfferShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        itemCount: 5, // Adjust the count based on your needs
        itemBuilder: (context, index) {
          return ShimmerOfferCard();
        },
      ),
    );
  }
}

class ShimmerOfferCard extends StatelessWidget {
  const ShimmerOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    final base = Colors.grey.shade300;
    final highlight = Colors.grey.shade100;

    return Container(
      padding: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.grey1, width: 2)),
      ),
      child: Column(
        children: [
          AppSpacing.h12,

          // Banner (180) with a small top-left pill
          Shimmer.fromColors(
            baseColor: base,
            highlightColor: highlight,
            child: Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      height: 24,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          AppSpacing.h10,

          // Business row
          Row(
            children: [
              // avatar
              Shimmer.fromColors(
                baseColor: base,
                highlightColor: highlight,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              AppSpacing.w12,

              // name + category
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: base,
                  highlightColor: highlight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _line(height: 16, widthFactor: 0.6),
                      const SizedBox(height: 8),
                      _line(height: 14, widthFactor: 0.35),
                    ],
                  ),
                ),
              ),

              // Visit button placeholder
              Shimmer.fromColors(
                baseColor: base,
                highlightColor: highlight,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _line({required double height, required double widthFactor}) {
  return FractionallySizedBox(
    widthFactor: widthFactor,
    child: Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
    ),
  );
}
