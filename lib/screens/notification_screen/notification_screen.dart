import 'package:customer_app/config/app_color/app_color.dart';
import 'package:customer_app/config/app_constant/app_constant.dart';
import 'package:customer_app/config/app_constant/app_font_size.dart';
import 'package:customer_app/config/utils/app_padding.dart';
import 'package:customer_app/config/utils/app_spacing.dart';
import 'package:customer_app/screens/business_screen/business_screen.dart';
import 'package:customer_app/screens/notification_screen/notification_screen_cnt.dart';
import 'package:customer_app/screens/notification_screen/widget/notification_shimmer.dart';
import 'package:customer_app/shared/widgets/app_text.dart';
import 'package:customer_app/shared/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationScreenCnt cnt = Get.put(NotificationScreenCnt());
    return Scaffold(
      appBar: buildAppBar(title: 'Notifications'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppSpacing.h12,
              Padding(
                padding: AppPadding.horizontal16,
                child: Obx(() {
                  if (cnt.isLoading.value) {
                    return NotificationShimmerList();
                  }
                  return CustomScrollView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return NotificationTile(
                            dateText: 'Dec 8, 2025',
                            unread: true,
                            onTap: () {
                              if (index == 0) {
                                cnt.getNotifications();
                              } else {
                                Get.to(() => BusinessScreen());
                              }
                            },
                          );
                        }, childCount: 5),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
    this.onTap,
    this.unread = true,
    this.dateText = 'Dec 8, 2025',
  });

  final VoidCallback? onTap;
  final bool unread;
  final String dateText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Material(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: AppColors.white,

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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Leading circular initial
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    // subtle tinted background
                    color: AppColors.appBgColor,
                  ),
                  child: AppText(
                    text: 'V.',
                    fontWeight: appBoldFont,
                    fontSize: AppFontSize.s24,
                  ),
                ),
                AppSpacing.w12,

                // Text area
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      AppText(
                        text: 'Navaratri offer',
                        fontWeight: appBoldFont,
                        fontSize: AppFontSize.s18,
                        color: AppColors.primary,
                        textAlign: TextAlign.start,
                        softWrap: true,
                      ),
                      AppSpacing.h4,
                      // Subline with "point" (•) and date
                      Row(
                        children: [
                          Flexible(
                            child: AppText(
                              text: 'Vantara Fashion',
                              fontWeight: appBoldFont,
                              fontSize: AppFontSize.s14,
                              color: AppColors.textSecondary,
                              maxLines: 1,
                              overFlow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          AppSpacing.w8,
                          // the "point" separator
                          Container(
                            width: 4,
                            height: 4,
                            decoration: BoxDecoration(
                              // ignore: deprecated_member_use
                              color: AppColors.textSecondary.withOpacity(0.6),
                              shape: BoxShape.circle,
                            ),
                          ),
                          AppSpacing.w8,
                          AppText(
                            text: dateText,
                            fontSize: AppFontSize.s14,
                            color: AppColors.textSecondary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                AppSpacing.w8,

                // Trailing unread indicator (small point)
                if (unread)
                  Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
