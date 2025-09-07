import 'package:customer_app/config/app_constant/app_assets.dart';
import 'package:customer_app/config/app_constant/app_enum.dart';
import 'package:customer_app/config/utils/app_padding.dart';
import 'package:customer_app/config/utils/app_spacing.dart';
import 'package:customer_app/screens/favourite_screen/favourite_screen_cnt.dart';
import 'package:customer_app/screens/home_screen/home_screen.dart';
import 'package:customer_app/shared/business_card.dart';
import 'package:customer_app/shared/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FavouriteScreenCnt cnt = Get.put(FavouriteScreenCnt());
    return Scaffold(
      appBar: buildAppBar(title: 'Favourite Business'),
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
                          isFavourite: true,
                          imageProvider: AssetImage(shopImage),
                          onTap: () {
                            // navigate to details
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
