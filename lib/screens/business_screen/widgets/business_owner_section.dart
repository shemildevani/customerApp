// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:customer_app/config/app_color/app_color.dart';
import 'package:customer_app/config/app_constant/app_constant.dart';
import 'package:customer_app/config/app_constant/app_font_size.dart';
import 'package:customer_app/config/utils/app_spacing.dart';
import 'package:customer_app/models/user_model.dart';
import 'package:customer_app/shared/widgets/app_text.dart';
import 'package:flutter/material.dart';


class BusinessOwnersSection extends StatelessWidget {
  final List<UserModel> owners;

  const BusinessOwnersSection({super.key, required this.owners});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: 'Business Owners',
            fontWeight: appBoldFont,
            fontSize: AppFontSize.s18,
          ),
          AppSpacing.h12,

          // Multiple owners
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: owners.length,
            separatorBuilder: (_, __) => AppSpacing.h10,
            itemBuilder: (context, index) {
              final owner = owners[index];
              return _OwnerTile(owner: owner);
            },
          ),
        ],
      ),
    );
  }
}

class _OwnerTile extends StatelessWidget {
  final UserModel owner;
  const _OwnerTile({required this.owner});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.grey1.withOpacity(0.08),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar (initials)
          CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.primary.withOpacity(0.15),
            child: AppText(
              text: owner.firstName.isNotEmpty
                  ? owner.firstName[0].toUpperCase()
                  : '?',
              fontWeight: appBoldFont,
              fontSize: AppFontSize.s16,
              color: AppColors.primary,
            ),
          ),
          AppSpacing.w12,

          // Details (Name + Email only)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: '${owner.firstName} ${owner.lastName}',
                  fontWeight: appBoldFont,
                  fontSize: AppFontSize.s16,
                ),
                if (owner.email?.isNotEmpty ?? false) ...[
                  AppSpacing.h4,
                  AppText(
                    text: owner.email!,
                    fontSize: AppFontSize.s14,
                    color: AppColors.grey2,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
