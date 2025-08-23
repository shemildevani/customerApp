// import 'dart:io';
// import 'package:virtueinsight/core/config/config.dart';

// class WebSidebar extends StatelessWidget {
//   final int selectedIndex;
//   final void Function(int index) onItemTap;

//   const WebSidebar({
//     required this.selectedIndex,
//     required this.onItemTap,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: kIsWeb ? false : true,
//       bottom: false,
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 10),
//         padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             AppSpacing.h8,
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 10,
//                   horizontal: 8,
//                 ),
//                 child: SvgPicture.asset(
//                   Theme.of(context).brightness == Brightness.dark
//                       ? AppAssets.logoWhiteSvg
//                       : AppAssets.logoSvg,
//                 ),
//               ),
//             ),
//             AppSpacing.h10,
//             Divider(
//               color: Theme.of(context).highlightColor.withValues(alpha: 0.09),
//               thickness: 1,
//             ),
//             AppSpacing.h10,
//             SidebarItem(
//               icon: Icons.event,
//               label: 'Events',
//               selected: selectedIndex == 0,
//               onTap: () => onItemTap(0),
//             ),
//             SidebarItem(
//               icon: Icons.chat,
//               label: 'Chats',
//               selected: selectedIndex == 1,
//               onTap: () => onItemTap(1),
//             ),
//             SidebarItem(
//               icon: Icons.person,
//               label: 'Profile',
//               selected: selectedIndex == 2,
//               onTap: () => onItemTap(2),
//             ),
//             SidebarItem(
//               icon: Icons.contact_support_outlined,
//               label: 'FAQ',
//               selected: selectedIndex == 3,
//               onTap: () => onItemTap(3),
//             ),
//             SidebarItem(
//               icon: Icons.perm_contact_cal,
//               label: 'Contact Us',
//               selected: selectedIndex == 4,
//               onTap: () => onItemTap(4),
//             ),
//             const Spacer(),
//             SidebarItem(
//               icon: Icons.logout,
//               label: Pref().getString(Pref.token).isEmpty ? 'Log In' : 'Logout',
//               selected: selectedIndex == 5,
//               onTap: () => onItemTap(5),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SidebarItem extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final bool selected;
//   final VoidCallback onTap;

//   const SidebarItem({
//     required this.icon,
//     required this.label,
//     required this.selected,
//     required this.onTap,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 6),
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       decoration: BoxDecoration(
//         color:
//             selected
//                 ? Theme.of(context).secondaryHeaderColor
//                 : AppColors.transparent,
//         boxShadow: [
//           BoxShadow(
//             color:
//                 selected
//                     ? AppColors.black.withValues(alpha: 0.09)
//                     : AppColors.transparent,
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, color: selected ? AppColors.white : AppColors.grey1),
//           AppSpacing.w10,
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 16,
//               color: selected ? AppColors.white : AppColors.grey1,
//             ),
//           ),
//         ],
//       ),
//     ).onTap(onTap);
//   }
// }

// final GlobalKey<ScaffoldState> sKey = GlobalKey();

// class ScaffoldWithSidebar extends StatelessWidget {
//   final Widget child;

//   const ScaffoldWithSidebar({required this.child, super.key});

//   int _getSelectedIndex(BuildContext context) {
//     final location = GoRouterState.of(context).uri.toString();
//     if (location.startsWith(AppRouteConst.chats)) return 1;
//     if (location.startsWith(AppRouteConst.profile)) return 2;
//     if (location.startsWith(AppRouteConst.faq)) return 3;
//     if (location.startsWith(AppRouteConst.contactUs)) return 4;
//     return 0;
//   }

//   void _onItemTapped(int index, BuildContext context) {
//     switch (index) {
//       case 0:
//         context.go(AppRouteConst.events);
//         break;
//       case 1:
//         context.go(AppRouteConst.chats);
//         break;
//       case 2:
//         context.go(AppRouteConst.profile);
//         break;
//       case 3:
//         context.go(AppRouteConst.faq);
//         break;
//       case 4:
//         context.go(AppRouteConst.contactUs);
//         break;
//       case 5:
//         Pref().clearSharedPreferences();
//         context.go(AppRouteConst.init);
//         break;
//     }
//   }

//   Future<bool?> _showBackDialog(BuildContext context) {
//     return showDialog<bool>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Are you sure?'),
//           content: const Text('Are you sure you want to leave this page?'),
//           actions: <Widget>[
//             TextButton(
//               style: TextButton.styleFrom(
//                 textStyle: Theme.of(context).textTheme.labelLarge,
//               ),
//               child: const Text('Never mind'),
//               onPressed: () {
//                 Navigator.pop(context, false);
//               },
//             ),
//             TextButton(
//               style: TextButton.styleFrom(
//                 textStyle: Theme.of(context).textTheme.labelLarge,
//               ),
//               child: const Text('Leave'),
//               onPressed: () {
//                 Navigator.pop(context, true);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isWide = RH.isDesktop(context);
//     final selectedIndex = _getSelectedIndex(context);

//     return PopScope(
//       canPop: false,
//       onPopInvokedWithResult: (bool didPop, Object? result) async {
//         if (didPop) {
//           return;
//         }
//         final bool shouldPop = await _showBackDialog(context) ?? false;
//         if (context.mounted && shouldPop) {
//           if (!kIsWeb && Platform.isAndroid) {
//             SystemNavigator.pop();
//           }
//         }
//       },
//       child: Scaffold(
//         key: sKey,
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         resizeToAvoidBottomInset: true,
//         body: SafeArea(
//           bottom: false,
//           child: Row(
//             children: [
//               if (isWide)
//                 SizedBox(
//                   width: 250,
//                   child: WebSidebar(
//                     selectedIndex: selectedIndex,
//                     onItemTap: (idx) => _onItemTapped(idx, context),
//                   ),
//                 ),
//               Expanded(
//                 child: Container(
//                   decoration: borderDecoration(context, isTopBorderOnly: true),
//                   child: child,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
