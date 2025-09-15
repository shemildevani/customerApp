import 'package:customer_app/config/app_color/app_color.dart';
import 'package:customer_app/config/app_constant/app_constant.dart';
import 'package:customer_app/config/app_constant/app_font_size.dart';
import 'package:customer_app/config/utils/app_padding.dart';
import 'package:customer_app/config/utils/app_spacing.dart';
import 'package:customer_app/models/day_timing_model.dart';
import 'package:customer_app/models/user_model.dart';
import 'package:customer_app/screens/business_screen/business_screen_cnt.dart';
import 'package:customer_app/screens/business_screen/widgets/business_address_widget.dart';
import 'package:customer_app/screens/business_screen/widgets/business_owner_section.dart';
import 'package:customer_app/screens/business_screen/widgets/business_website.dart';
import 'package:customer_app/screens/business_screen/widgets/ongoing_offers_card.dart';
import 'package:customer_app/screens/business_screen/widgets/opening_hour_widget.dart';
import 'package:customer_app/shared/widgets/app_snackbar.dart';
import 'package:customer_app/shared/widgets/app_text.dart';
import 'package:customer_app/shared/widgets/appbar.dart';
import 'package:customer_app/shared/widgets/business_open_closed_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({super.key});

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  final cnt = Get.put(BusinessScreenCnt());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'Business Preview',
        action: [
          IconButton(
            onPressed: () async => Share.share('https://www.mystore.com'),
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _OngoingOffersSection(),
              _HeaderSection(),
              _CoreInfoSection(),
              _ImagesSection(),
              _SellerLinksSection(),
              BusinessWebsiteCard(url: 'https://www.mystore.com'),
              _AddressMapSection(),
              _SocialAccountsSection(),
              _AboutSection(),
              _OwnersSection(),
            ],
          ),
        ),
      ),
    );
  }
}

/* ==============================
 * Data (dummy for preview)
 * ============================== */

var _dummyOwners = <UserModel>[
  UserModel(
    firstName: "John",
    lastName: "Doe",
    email: "john@example.com",
    phoneNumber: "1234567890",
    city: "Berlin",
    state: "BE",
    pincode: "10115",
  ),
  UserModel(
    firstName: "Jane",
    lastName: "Smith",
    email: "jane@example.com",
    phoneNumber: "0987654321",
    city: "Munich",
    state: "BY",
    pincode: "80331",
  ),
];

final _dummyWeekTimings = <DayTiming>[
  DayTiming(day: "Monday", openTime: "9:00 AM", closeTime: "6:00 PM"),
  DayTiming(day: "Tuesday", openTime: "9:00 AM", closeTime: "6:00 PM"),
  DayTiming(day: "Wednesday", openTime: "9:00 AM", closeTime: "6:00 PM"),
  DayTiming(day: "Thursday", openTime: "9:00 AM", closeTime: "6:00 PM"),
  DayTiming(day: "Friday", openTime: "9:00 AM", closeTime: "6:00 PM"),
  DayTiming(day: "Saturday", openTime: "10:00 AM", closeTime: "4:00 PM"),
  DayTiming(day: "Sunday", openTime: "", closeTime: "", isClosed: true),
];

/* ==============================
 * Sections
 * ============================== */

class _OngoingOffersSection extends StatelessWidget {
  const _OngoingOffersSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.06),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: AppText(
                text: "Ongoing Offers",
                fontWeight: appBoldFont,
                fontSize: AppFontSize.s18,
              ),
            ),
            AppSpacing.h6,
            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder:
                    (context, index) => Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 12 : 6,
                        right: index == 2 ? 12 : 6,
                      ),
                      child: OfferCard(
                        title: 'Summer Sale ${index + 1}',
                        subtitle: 'Flat 30% OFF on all T-Shirts',
                        discountText: '30% OFF',
                        validText: 'Valid till 30 Sep',
                        imageAsset: 'assets/images/banner.jpg',
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.grey1, width: 2),
            ),
            child: Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          AppSpacing.w12,
          // Name + Category + Follow
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: 'Business Name',
                  fontWeight: appBoldFont,
                  fontSize: AppFontSize.s20,
                ),
                AppSpacing.h4,
                AppText(
                  text: 'Clothing Store',
                  fontSize: AppFontSize.s16,
                  color: AppColors.grey2,
                ),
                AppSpacing.h4,
                Row(
                  children: const [
                    _FollowButton(),
                    AppSpacing.w12,
                    _FollowersPill(countText: '12'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CoreInfoSection extends StatelessWidget {
  const _CoreInfoSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.appPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status + Hours
          Row(
            children: [
              const BusinessOpenClosedStatus(isOpen: true),
              AppSpacing.w12,
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.grey1.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.access_time, size: 16, color: AppColors.grey2),
                    AppSpacing.w6,
                    AppText(
                      text: '9:00 AM - 8:00 PM',
                      fontSize: AppFontSize.s14,
                      color: AppColors.grey2,
                    ),
                  ],
                ),
              ),
            ],
          ),

          AppSpacing.h16,

          // Rating
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 20),
              AppSpacing.w6,
              AppText(
                text: '4.5',
                fontSize: AppFontSize.s16,
                fontWeight: appBoldFont,
                color: AppColors.grey2,
              ),
            ],
          ),

          AppSpacing.h16,

          // Social buttons (Phone / WhatsApp / Mail)
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _SocialButton(
                icon: FontAwesomeIcons.phone,
                label: "Phone",
                color: AppColors.blue,
                onTap: () {},
              ),
              _SocialButton(
                icon: FontAwesomeIcons.whatsapp,
                label: "WhatsApp",
                color: AppColors.green,
                onTap: () {},
              ),
              _SocialButton(
                icon: Icons.email_outlined,
                label: "Mail",
                color: Colors.pinkAccent,
                onTap: () {},
              ),
              _SocialButton(
                // ignore: deprecated_member_use
                icon: FontAwesomeIcons.bank,
                label: "UPI ID",
                color: Colors.deepPurple,
                onTap: () async {
                  final String upiId =
                      "yourupiid@upi"; // 👈 your business UPI ID
                  Clipboard.setData(ClipboardData(text: upiId));
                  showAppSnackBar( "UPI ID copied to clipboard");
                  
                },
              ),
            ],
          ),

          AppSpacing.h16,

          // Opening hours
          openingHoursCardUI(_dummyWeekTimings),
        ],
      ),
    );
  }
}

class _ImagesSection extends StatelessWidget {
  const _ImagesSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.appPadding,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.06),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: 'Images',
                    color: AppColors.black,
                    fontWeight: appMediumFont,
                    fontSize: AppFontSize.s16,
                  ),
                  Material(
                    color: AppColors.transparent,

                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 4,
                        ),
                        child: AppText(
                          text: 'See All',
                          color: AppColors.primary,
                          fontWeight: appBoldFont,
                          fontSize: AppFontSize.s16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppSpacing.h14,
            Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 12),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:
                      (context, index) => Container(
                        margin: const EdgeInsets.only(right: 12),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: AppColors.grey1,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.image,
                          color: Colors.white70,
                          size: 40,
                        ),
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SellerLinksSection extends StatelessWidget {
  const _SellerLinksSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.appPadding,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
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
              text: 'Seller Account Links',
              fontWeight: appBoldFont,
              fontSize: AppFontSize.s18,
            ),
            AppSpacing.h12,
            Wrap(
              spacing: 16,
              runSpacing: 10,
              children: const [
                _SellerTextLink(label: 'Amazon', color: Colors.orange),
                _SellerTextLink(label: 'Shopify', color: Colors.green),
                _SellerTextLink(label: 'eBay', color: Colors.red),
                _SellerTextLink(label: 'Facebook Shop', color: AppColors.blue),
                _SellerTextLink(label: 'Instagram Shop', color: Colors.pink),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AddressMapSection extends StatelessWidget {
  const _AddressMapSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.appPadding,
      child: AddressMapCard(
        address: '123 Main St., Citysville, ST 12345',
        mapImage: 'assets/images/map_preview.png',
        onTap: () {
          launchUrlInBrowser(
            'https://www.google.com/maps/place/123+Main+St.,+Citysville,+ST+12345',
          );
        },
      ),
    );
  }
}

class _SocialAccountsSection extends StatelessWidget {
  const _SocialAccountsSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.appPadding,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.06),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: AppText(
                text: 'Social Account',
                fontWeight: appBoldFont,
                fontSize: AppFontSize.s18,
                textAlign: TextAlign.start,
              ),
            ),
            _IconCircleButton(
              icon: FontAwesomeIcons.facebook,
              color: AppColors.blue,
              onTap: () {},
            ),
            AppSpacing.w8,
            _IconCircleButton(
              icon: FontAwesomeIcons.instagram,
              color: Colors.pink,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _AboutSection extends StatelessWidget {
  const _AboutSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.appPadding,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
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
              text: 'About',
              fontWeight: appBoldFont,
              fontSize: AppFontSize.s18,
            ),
            AppSpacing.h10,
            AppText(
              text:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              textAlign: TextAlign.start,
              color: AppColors.grey2,
              fontSize: AppFontSize.s14,
            ),
          ],
        ),
      ),
    );
  }
}

class _OwnersSection extends StatelessWidget {
  const _OwnersSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.appPadding.copyWith(bottom: 16),
      child: BusinessOwnersSection(owners: _dummyOwners),
    );
  }
}

/* ==============================
 * Small Reusable Widgets
 * ============================== */

class _FollowButton extends StatelessWidget {
  const _FollowButton();

  @override
  Widget build(BuildContext context) {
    final cnt = Get.find<BusinessScreenCnt>();

    return Obx(
      () => Material(
        color: cnt.isFollowed.value ? AppColors.white : AppColors.primary,
        borderRadius: BorderRadius.circular(12),

        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            cnt.isFollowed.value = !cnt.isFollowed.value;
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    cnt.isFollowed.value
                        ? AppColors.primary
                        : AppColors.transparent,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(12),
              color: cnt.isFollowed.value ? AppColors.white : AppColors.primary,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Row(
              children: [
                if (!cnt.isFollowed.value) ...[
                  const Icon(
                    FontAwesomeIcons.userPlus,
                    color: AppColors.white,
                    size: 16,
                  ),
                  AppSpacing.w8,
                ],
                AppText(
                  text: cnt.isFollowed.value ? 'Following' : 'Follow',
                  color:
                      cnt.isFollowed.value
                          ? AppColors.primary
                          : AppColors.white,
                  fontSize: AppFontSize.s16,
                  fontWeight: appBoldFont,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FollowersPill extends StatelessWidget {
  final String countText;
  const _FollowersPill({required this.countText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.grey1.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey1, width: 1),
      ),
      child: Row(
        children: [
          const Icon(
            FontAwesomeIcons.users,
            color: AppColors.primary,
            size: 16,
          ),
          AppSpacing.w8,
          AppText(
            text: countText,
            color: AppColors.primary,
            fontSize: AppFontSize.s16,
            fontWeight: appBoldFont,
          ),
        ],
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  final VoidCallback? onTap;

  const _SocialButton({
    required this.icon,
    required this.label,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue.shade50,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 20),
              AppSpacing.w8,
              AppText(
                text: label,
                fontSize: AppFontSize.s14,
                color: color,
                fontWeight: appBoldFont,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SellerTextLink extends StatelessWidget {
  final String label;
  final Color color;
  const _SellerTextLink({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: () {
          // TODO: open seller link
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: color.withOpacity(0.08),
          ),
          child: AppText(
            text: label,
            fontSize: AppFontSize.s14,
            fontWeight: appBoldFont,
            color: color,
          ),
        ),
      ),
    );
  }
}

class _IconCircleButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _IconCircleButton({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(6),
          child: Icon(icon, color: color, size: 26),
        ),
      ),
    );
  }
}
