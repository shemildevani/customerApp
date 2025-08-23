// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:customer_app/config/app_color/app_color.dart';
// import 'package:customer_app/config/app_constant/app_assets.dart';
// import 'package:customer_app/config/app_constant/app_font_size.dart';
// import 'package:customer_app/config/utils/app_padding.dart';
// import 'package:customer_app/config/utils/app_spacing.dart';
// import 'package:customer_app/models/day_views.dart';
// import 'package:customer_app/shared/widgets/app_text.dart';

// class DashBoardScreen extends StatelessWidget {
//   const DashBoardScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, dynamic>> screenNames = [
//       mapping(name: '+Add campaign', icon: FontAwesomeIcons.box),
//       mapping(name: 'Business Info', icon: FontAwesomeIcons.peopleGroup),
//       mapping(name: 'User Info', icon: FontAwesomeIcons.store),
//       mapping(name: 'Reviews', icon: FontAwesomeIcons.receipt),
//     ];
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: AppColors.black),
//         title: Text(
//           'Dashboard',
//           style: TextStyle(color: AppColors.black, fontSize: 18),
//         ),
//         centerTitle: true,
//       ),

//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: AppPadding.appPadding,
//           child: Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: AppColors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black12,
//                       blurRadius: 6,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     // Shop Logo
//                     Container(
//                       height: 80,
//                       width: 80,
//                       padding: EdgeInsets.all(3),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(color: AppColors.primary, width: 2),
//                       ),
//                       child: ClipOval(
//                         child: Image(
//                           image: AssetImage(shopImage),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     AppSpacing.w12,

//                     // Shop Details
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Shop Name + Status Row
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Expanded(
//                                 child: AppText(
//                                   text: 'Shop Name',
//                                   fontSize: AppFontSize.s18,
//                                   fontWeight: appBoldFont,
//                                   textAlign: TextAlign.start,
//                                 ),
//                               ),
//                               Container(
//                                 padding: EdgeInsets.symmetric(
//                                   horizontal: 8,
//                                   vertical: 4,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   // ignore: deprecated_member_use
//                                   color: Colors.green.withOpacity(0.15),
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Icon(
//                                       Icons.circle,
//                                       size: 10,
//                                       color: Colors.green.shade700,
//                                     ),
//                                     SizedBox(width: 4),
//                                     Text(
//                                       "Open",
//                                       style: TextStyle(
//                                         color: Colors.green.shade800,
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),

//                           SizedBox(height: 4),
//                           AppText(
//                             text: 'Fashion',
//                             fontSize: AppFontSize.s14,
//                             color: Colors.grey.shade600,
//                           ),
//                           SizedBox(height: 8),

//                           // Followers Info
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.people,
//                                 size: 16,
//                                 color: AppColors.primary,
//                               ),
//                               SizedBox(width: 4),
//                               Text(
//                                 '100 Followers',
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.black87,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // ⬇️ paste here, right after the shop details Card
//               AppSpacing.h16,
//               Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: AppColors.white,
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black12,
//                       blurRadius: 6,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const AppText(
//                       text: 'Daily Views (Last 7 Days)',
//                       fontSize: AppFontSize.s16,
//                       fontWeight: FontWeight.w700,
//                       color: AppColors.black,
//                       textAlign: TextAlign.left,
//                     ),
//                     AppSpacing.h12,
//                     SizedBox(
//                       height: 180,
//                       child: _DailyViewsChart(
//                         data: const [
//                           DayViews('Mon', 120),
//                           DayViews('Tue', 90),
//                           DayViews('Wed', 150),
//                           DayViews('Thu', 80),
//                           DayViews('Fri', 200),
//                           DayViews('Sat', 240),
//                           DayViews('Sun', 180),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               AppSpacing.h20,

//               GridView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: screenNames.length,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                 ),
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     key: screenNames[index]['key'],
//                     onTap: screenNames[index]['onTap'],
//                     child: Card(
//                       child: Container(
//                         alignment: Alignment.center,
//                         padding: const EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           color: AppColors.white,
//                           // border: Border.all(color: AppColors.grey1),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             CircleAvatar(
//                               radius: 30,
//                               backgroundColor: Colors.blue.shade50,
//                               child: FaIcon(
//                                 screenNames[index]['icon'],
//                                 color: AppColors.primary,
//                                 size: 30,
//                               ),
//                             ),
//                             AppSpacing.h6,
//                             AppText(
//                               text: '${screenNames[index]['name']}',
//                               overFlow: TextOverflow.clip,
//                               maxLines: 2,
//                               textAlign: TextAlign.center,
//                               softWrap: true,
//                               fontSize: AppFontSize.s16,
//                               fontWeight: appBoldFont,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Map<String, dynamic> mapping({
//     required String name,
//     required IconData icon,
//     VoidCallback? onTap,
//   }) {
//     return {'name': name, 'icon': icon, 'onTap': onTap};
//   }
// }

// // simple model

// class _DailyViewsChart extends StatelessWidget {
//   final List<DayViews> data;
//   const _DailyViewsChart({required this.data});

//   @override
//   Widget build(BuildContext context) {
//     final maxY =
//         (data.map((e) => e.views).reduce((a, b) => a > b ? a : b) * 1.2);
//     return LineChart(
//       LineChartData(
//         minY: 0,
//         maxY: maxY,
//         gridData: FlGridData(
//           show: true,
//           drawVerticalLine: false,
//           horizontalInterval: maxY / 4,
//           getDrawingHorizontalLine:
//               (_) => FlLine(color: Colors.black12, strokeWidth: 1),
//         ),
//         titlesData: FlTitlesData(
//           rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//           topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//           leftTitles: AxisTitles(
//             sideTitles: SideTitles(
//               showTitles: true,
//               reservedSize: 36,
//               interval: (maxY / 4),
//               getTitlesWidget:
//                   (v, _) => Text(
//                     v.toInt().toString(),
//                     style: const TextStyle(fontSize: 11, color: Colors.grey),
//                   ),
//             ),
//           ),
//           bottomTitles: AxisTitles(
//             sideTitles: SideTitles(
//               showTitles: true,
//               getTitlesWidget: (v, _) {
//                 final i = v.toInt();
//                 if (i < 0 || i >= data.length) return const SizedBox.shrink();
//                 return Padding(
//                   padding: const EdgeInsets.only(top: 6),
//                   child: Text(
//                     data[i].day,
//                     style: const TextStyle(fontSize: 11, color: Colors.grey),
//                   ),
//                 );
//               },
//               interval: 1,
//               reservedSize: 28,
//             ),
//           ),
//         ),
//         lineTouchData: LineTouchData(
//           enabled: true,
//           touchTooltipData: LineTouchTooltipData(
//             getTooltipItems:
//                 (spots) =>
//                     spots.map((s) {
//                       final i = s.x.toInt();
//                       return LineTooltipItem(
//                         '${data[i].day}\n${data[i].views.toInt()} views',
//                         const TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       );
//                     }).toList(),
//           ),
//         ),
//         borderData: FlBorderData(
//           show: true,
//           border: Border.all(color: Colors.black12),
//         ),
//         lineBarsData: [
//           LineChartBarData(
//             isCurved: true,
//             spots: [
//               for (int i = 0; i < data.length; i++)
//                 FlSpot(i.toDouble(), data[i].views),
//             ],
//             color: AppColors.primary,
//             barWidth: 3,
//             dotData: FlDotData(
//               show: true,
//               getDotPainter:
//                   (spot, _, __, ___) =>
//                       FlDotCirclePainter(radius: 3, color: AppColors.primary),
//             ),
//             belowBarData: BarAreaData(
//               show: true,
//               color: AppColors.primary.withValues(alpha: .12),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
