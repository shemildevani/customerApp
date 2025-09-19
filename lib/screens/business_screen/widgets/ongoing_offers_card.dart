import 'package:customer_app/config/app_color/app_color.dart';
import 'package:flutter/material.dart';

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
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/offer.jpg'),
          fit: BoxFit.fill,
        ),
        border: Border.all(color: AppColors.grey1.withOpacity(0.5)),
      ),
    );
  }
}
