import 'package:customer_app/config/app_color/app_color.dart';
import 'package:customer_app/config/app_constant/app_constant.dart';
import 'package:customer_app/config/app_constant/app_font_size.dart';
import 'package:customer_app/config/utils/app_padding.dart';
import 'package:customer_app/config/utils/app_spacing.dart';
import 'package:customer_app/screens/auth/login/login_screen.dart';
import 'package:customer_app/screens/data_collection/user_data/user_data_screen.dart';
import 'package:customer_app/screens/profile_screen/profile_screen_cnt.dart';
import 'package:customer_app/shared/widgets/app_text.dart';
import 'package:customer_app/shared/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileScreenCnt cnt = Get.put(ProfileScreenCnt());
    return Scaffold(
      appBar: buildAppBar(
        title: 'Profile',
        isRequiredLeading: false,
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppPadding.appPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // details section
              AppSpacing.h20,
              Container(
                // padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.white,

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    buildProfileOption(
                      icon: FontAwesomeIcons.user,
                      title: 'My Account',
                      onTap: () {
                        Get.to(() => UserDataScreen());
                      },
                    ),

                    Obx(
                      () => Material(
                        color: AppColors.transparent,
                        child: InkWell(
                          onTap: () {
                            cnt.isNotificationOn.value =
                                !cnt.isNotificationOn.value;
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color:
                                          // ignore: deprecated_member_use
                                          AppColors.primary.withOpacity(0.1),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.notifications_outlined,
                                          color: AppColors.primary,
                                          size: 24,
                                        ),
                                      ),
                                      AppSpacing.w16,
                                      AppText(
                                        text: 'Notifications',
                                        fontSize: AppFontSize.s14,
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),
                                Switch(
                                  value: cnt.isNotificationOn.value,
                                  activeThumbColor: AppColors.white,
                                  activeTrackColor: AppColors.green,
                                  inactiveThumbColor: AppColors.white,

                                  // ignore: deprecated_member_use
                                  inactiveTrackColor: AppColors.grey.withOpacity(
                                    0.6,
                                  ),
                                  onChanged:
                                      (value) =>
                                          cnt.isNotificationOn.value = value,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      decoration: BoxDecoration(color: AppColors.grey1),
                    ),

                    buildProfileOption(
                      icon: Icons.logout,
                      title: 'Logout',
                      color: AppColors.red,
                      isRequiredLine: false,
                      onTap: () {
                        Get.offAll(LoginScreen());
                      },
                    ),
                  ],
                ),
              ),

              // more
              AppSpacing.h20,
              AppText(
                text: 'More',
                fontSize: AppFontSize.s16,
                color: AppColors.grey2,
                fontWeight: appMediumFont,
                textAlign: TextAlign.start,
              ),
              AppSpacing.h10,

              Container(
                // padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    buildProfileOption(
                      icon: Icons.help_outline,
                      title: 'Help Center',
                      onTap: () {},
                    ),

                    buildProfileOption(
                      icon: Icons.privacy_tip_outlined,
                      title: 'Privacy & Policy',
                      onTap: () {},
                    ),

                    buildProfileOption(
                      icon: Icons.description_outlined,
                      title: 'Terms & Conditions',
                      onTap: () {},
                    ),

                    buildProfileOption(
                      icon: Icons.star_outline,
                      title: 'Rate Us',
                      onTap: () {},
                      isRequiredLine: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    double? size,
    Color? color,
    bool isRequiredLine = true,
  }) {
    return Material(
      color: AppColors.transparent,
      child: Column(
        children: [
          ListTile(
            shape:
                isRequiredLine
                    ? null
                    : RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            leading: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color:
                    color != null
                        // ignore: deprecated_member_use
                        ? color.withOpacity(0.1)
                        // ignore: deprecated_member_use
                        : AppColors.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: color ?? AppColors.primary,
                size: size ?? 24,
              ),
            ),
            title: AppText(
              text: title,
              fontSize: AppFontSize.s14,
              textAlign: TextAlign.start,
              color: color,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: color ?? AppColors.grey2,
            ),
            onTap: onTap,
          ),
          if (isRequiredLine) ...[
            AppSpacing.h4,
            Container(
              height: 1,
              decoration: BoxDecoration(color: AppColors.grey1),
            ),
          ],
        ],
      ),
    );
  }
}
