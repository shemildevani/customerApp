// ignore_for_file: deprecated_member_use

import 'package:customer_app/config/app_color/app_color.dart';
import 'package:customer_app/config/app_constant/app_constant.dart';
import 'package:customer_app/config/app_constant/app_font_size.dart';
import 'package:customer_app/config/utils/app_spacing.dart';
import 'package:customer_app/models/day_timing_model.dart';
import 'package:customer_app/shared/widgets/app_text.dart';
import 'package:flutter/material.dart';

/// Keep your existing model as-is.
/// class DayTiming { ... }

Widget openingHoursCardUI(List<DayTiming> timings) {
  // Normalize into a map for quick lookup, and order the week.
  final List<String> weekOrder = const [
    'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'
  ];

  // Build a map: day -> timing (if provided)
  final Map<String, DayTiming> byDay = {
    for (final t in timings) t.day: t,
  };

  // Ensure we render all 7 days (fallback to Closed if missing)
  final List<DayTiming> ordered = weekOrder.map((day) {
    if (byDay.containsKey(day)) return byDay[day]!;
    return DayTiming(day: day, openTime: '', closeTime: '', isClosed: true);
  }).toList();

  // Figure out "today"
  final int todayIndex = DateTime.now().weekday - 1; // Monday=1 … Sunday=7
  final String todayName = weekOrder[todayIndex];
  final DayTiming today = byDay[todayName] ??
      DayTiming(day: todayName, openTime: '', closeTime: '', isClosed: true);

  final String todayRight = today.isClosed
      ? 'Closed today'
      : 'Open • ${_span(today.openTime, today.closeTime)}';

  // Off days (for the bottom red row)
  final String offDaysText = ordered
      .where((d) => d.isClosed)
      .map((d) => d.day)
      .join(', ')
      .toString();

  return Container(
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
          text: 'Timing of Business',
          fontWeight: appBoldFont,
          fontSize: AppFontSize.s18,
        ),
        AppSpacing.h12,

        // Today summary
        _RowLine(
          left: 'Today',
          right: todayRight,
          isBold: true,
          rightColor: today.isClosed ? Colors.red : AppColors.black,
        ),
        AppSpacing.h8,

        // Full weekly schedule
        ...ordered.map((d) => _RowLine(
              left: d.day,
              right: d.isClosed ? 'Closed' : _span(d.openTime, d.closeTime),
              rightColor: d.isClosed ? Colors.red : AppColors.black,
            )),

        AppSpacing.h12,
        Divider(color: AppColors.grey1.withOpacity(0.5), height: 1),
        AppSpacing.h12,

        // Off days (aggregated)
        Row(
          children: [
            const Icon(Icons.event_busy, size: 18, color: Colors.red),
            AppSpacing.w8,
            Expanded(
              child: AppText(
                text: offDaysText.isEmpty
                    ? 'No weekly off days'
                    : 'Off days: $offDaysText',
                color: Colors.red,
                fontSize: AppFontSize.s14,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class _RowLine extends StatelessWidget {
  final String left;
  final String right;
  final bool isBold;
  final Color? rightColor;
  const _RowLine({
    required this.left,
    required this.right,
    this.isBold = false,
    this.rightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(
            child: AppText(
              text: left,
              fontWeight: isBold ? appBoldFont : null,
              fontSize: isBold ? AppFontSize.s16 : AppFontSize.s14,
              textAlign: TextAlign.start,
            ),
          ),
          AppText(
            text: right,
            color: rightColor ?? AppColors.black,
            fontWeight: isBold ? appBoldFont : null,
            textAlign: TextAlign.start,
            fontSize: isBold ? AppFontSize.s16 : AppFontSize.s14,
          ),
        ],
      ),
    );
  }
}

/// Helper to display "open – close" compactly.
/// Assumes strings are already in the format you want to show (e.g., "9:00 AM").
String _span(String open, String close) {
  if (open.isEmpty && close.isEmpty) return '';
  if (open.isEmpty) return close;
  if (close.isEmpty) return open;
  return '$open – $close';
}
