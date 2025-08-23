// import 'package:virtueinsight/shared/widgets/app_sidebar.dart';
// import 'package:virtueinsight/core/config/config.dart';

// class BaseDrawer extends StatelessWidget {
//   const BaseDrawer({super.key});

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

//   @override
//   Widget build(BuildContext context) {
//     final selectedIndex = _getSelectedIndex(context);
//     return Drawer(
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       child: WebSidebar(
//         selectedIndex: selectedIndex,
//         onItemTap: (idx) {
//           Navigator.pop(context);
//           _onItemTapped(idx, context);
//         },
//       ),
//     );
//   }
// }
