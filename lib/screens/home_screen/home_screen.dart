import 'package:customer_app/config/app_color/app_color.dart';
import 'package:customer_app/config/app_constant/app_assets.dart';
import 'package:customer_app/config/app_constant/app_constant.dart';
import 'package:customer_app/config/app_constant/app_enum.dart';
import 'package:customer_app/config/utils/app_padding.dart';
import 'package:customer_app/config/utils/app_spacing.dart';
import 'package:customer_app/screens/business_preview/business_screen.dart';
import 'package:customer_app/screens/home_screen/home_screen_cnt.dart';
import 'package:customer_app/shared/business_card.dart';
import 'package:customer_app/shared/widgets/app_text.dart';
import 'package:customer_app/shared/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenCnt cnt = Get.put(HomeScreenCnt());
    return Scaffold(
      appBar: buildAppBar(
        title: 'Followed Business',
        action: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none, color: AppColors.primary),
          ),
          IconButton(
            onPressed: () {
              // Future<void> openScanner() async {
              //   final result = await Get.to<String>(
              //     () => const QrScannerScreen(),
              //   );
              //   if (result != null) {
              //     cnt.lastScan.value = result;
              //   }
              // }
            },
            icon: Icon(Icons.qr_code_scanner, color: AppColors.primary),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            AppSpacing.h12,
            Container(
              padding: EdgeInsets.only(left: 16, right: 6),
              height: 40,
              child: ListView.builder(
                itemCount: categoriesList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Obx(() {
                    // ignore: unrelated_type_equality_checks
                    final bool isSelected = cnt.selectedIndex == index;
                    return ListItemDesign(
                      title: categoriesList[index],
                      isSelected: isSelected,
                      onTap: () {
                        cnt.selectedIndex.value = index;
                      },
                    );
                  });
                },
              ),
            ),

            AppSpacing.h8,
            Expanded(
              child: Padding(
                padding: AppPadding.appPadding,

                child: CustomScrollView(
                  shrinkWrap: true,

                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return BusinessCard(
                          name: 'Business $index',
                          category: 'Fashion',
                          rating: 4.5,
                          isOpen: false,
                          isFavourite: false,
                          imageProvider: AssetImage(shopImage),
                          onTap: () {
                            // navigate to details
                            Get.to(() => BusinessScreen());
                          },
                        );
                      }, childCount: 5),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItemDesign extends StatelessWidget {
  const ListItemDesign({
    super.key,
    required this.isSelected,
    this.onTap,
    required this.title,
  });

  final bool isSelected;
  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: AppText(
            text: title,
            color: isSelected ? AppColors.white : AppColors.black,
            fontWeight: isSelected ? appBoldFont : null,
          ),
        ),
      ),
    );
  }
}
