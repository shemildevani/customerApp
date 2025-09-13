import 'package:customer_app/config/app_color/app_color.dart';
import 'package:customer_app/config/app_constant/app_constant.dart';
import 'package:customer_app/config/app_constant/app_font_size.dart';
import 'package:customer_app/config/utils/app_spacing.dart';
import 'package:customer_app/shared/widgets/app_text.dart';
import 'package:flutter/material.dart';


class AddressMapCard extends StatelessWidget {
  final String address;
  final String? mapImage; // asset or network url
  final VoidCallback? onTap;

  const AddressMapCard({
    super.key,
    required this.address,
    this.mapImage, // e.g. 'assets/images/map_preview.png' or 'https://...'
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      padding: const EdgeInsets.all(16),
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
      child: Row(
        children: [
          // Left: Title + Address
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: 'Address & Map',
                  fontWeight: appBoldFont,
                  fontSize: AppFontSize.s18,
                  color: AppColors.black,
                ),
                AppSpacing.h8,
                AppText(
                  text: address,
                  fontSize: AppFontSize.s14,
                  color: AppColors.black,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),

          AppSpacing.w12,

          // Right: Map preview (rounded)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 84,
              height: 72,
              child:
                  mapImage == null
                      ? _MapPlaceholder()
                      : (mapImage!.startsWith('http')
                          ? Image.network(mapImage!, fit: BoxFit.cover)
                          : Image.asset(
                            'assets/images/Google-Map.avif',
                            fit: BoxFit.cover,
                          )),
            ),
          ),
        ],
      ),
    );

    return onTap == null
        ? card
        : Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onTap,
            child: card,
          ),
        );
  }
}

class _MapPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ignore: deprecated_member_use
        Container(color: AppColors.grey1.withOpacity(0.2)),
        Center(
          child: Icon(Icons.location_pin, color: AppColors.primary, size: 28),
        ),
      ],
    );
  }
}