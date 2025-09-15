import 'package:customer_app/config/app_color/app_color.dart';
import 'package:customer_app/config/app_constant/app_assets.dart';
import 'package:customer_app/config/app_constant/app_constant.dart';
import 'package:customer_app/config/app_constant/app_font_size.dart';
import 'package:customer_app/config/utils/app_spacing.dart';
import 'package:customer_app/screens/business_screen/business_screen.dart';
import 'package:customer_app/screens/offer_screen/offer_screen_cnt.dart';
import 'package:customer_app/screens/offer_screen/widgets/offer_shimmer.dart';
import 'package:customer_app/shared/widgets/app_text.dart';
import 'package:customer_app/shared/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OfferScreenCnt cnt = Get.put(OfferScreenCnt());
    return Scaffold(
      appBar: buildAppBar(title: 'Business Offers'),
      body: SafeArea(
        child: Obx(() {
          if (cnt.isLoading.value) {
            return OfferShimmer();
          }
          return ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(bottom: 12, left: 16, right: 16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.grey1, width: 2),
                  ),
                ),
                child: Column(
                  children: [
                    AppSpacing.h12,
                    // offer banner
                    SizedBox(
                      height: 170,
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true, 
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery.sizeOf(context).width - 80,
                            margin: EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage('assets/images/offer.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: AppText(
                                      text: 'Ends in 5 Days',
                                      color: Colors.white,
                                      fontSize: AppFontSize.s14,
                                      fontWeight: appBoldFont,
                                    ),
                                  ),
                                ),

                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: AppText(
                                      text: 'Navaratri Offer',
                                      color: Colors.white,
                                      fontSize: AppFontSize.s14,
                                      fontWeight: appBoldFont,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    // business details
                    AppSpacing.h10,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(shopImage),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              AppSpacing.w12,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: 'Shop Name',

                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    maxLines: 1,
                                    overFlow: TextOverflow.ellipsis,
                                  ),
                                  AppText(
                                    text: 'Fashion',
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Material(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(12),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              if (index == 0) {
                                cnt.getOfferList();
                              } else {
                                Get.to(() => BusinessScreen());
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              child: Row(
                                children: [
                                  AppText(
                                    text: "Visit",
                                    color: AppColors.white,
                                    fontSize: AppFontSize.s16,
                                    fontWeight: appBoldFont,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
